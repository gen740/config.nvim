local M = {}

local running_jobid = nil
local api = vim.api
local f = vim.fn

---@class AsyncRunOptions
---@field on_exit? function
---@field no_qflist? boolean
---@field efm? string

-- Run command in async mode
---@param cmd string
---@param opt? AsyncRunOptions
M.asyncrun = function(cmd, opt)
  opt = opt or {}
  local on_exit = opt.on_exit or function() end
  local no_qflist = opt.no_qflist or false
  local efm = opt.efm or '%-G'

  if not no_qflist then
    if running_jobid then
      vim.notify('Command still runing', vim.log.levels.WARN)
      return
    end
    f.setqflist {} -- Reset qflist
  end

  local on_event = function(_, data, event)
    local qfwinid = f.getqflist({ winid = 0 }).winid
    if (event == 'stdout' or event == 'stderr') and not no_qflist then
      if data then
        for _, val in ipairs(data) do
          if val ~= '' then
            val = f.substitute(val, [[\[[0-9;]*m]], [[]], 'g') -- Remove escope codes
            f.setqflist({}, 'a', {
              title = cmd,
              lines = { val },
              efm = efm,
            })
          end
        end
        if qfwinid ~= 0 and qfwinid ~= nil then
          api.nvim_win_set_cursor(qfwinid, { api.nvim_buf_line_count(api.nvim_win_get_buf(qfwinid)), 0 })
        end
      end
    end
    if event == 'exit' then
      on_exit()
      if not no_qflist then
        f.setqflist({}, 'a', {
          title = cmd,
          lines = {
            '<<<EOC',
          },
          efm = efm,
        })
        api.nvim_command('doautocmd QuickFixCmdPost')
        if qfwinid ~= 0 and qfwinid ~= nil then
          api.nvim_win_set_cursor(qfwinid, { api.nvim_buf_line_count(api.nvim_win_get_buf(qfwinid)), 0 })
        end
        running_jobid = nil
      end
    end
  end

  running_jobid = f.jobstart(cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdout_buffered = false,
    stderr_buffered = false,
  })
end

---@param pattern string
M.ripgrep = function(pattern, dir)
  M.asyncstop()
  dir = dir or '.'

  pattern = 'rg --column ' .. pattern .. ' ' .. dir

  if running_jobid then
    vim.notify('Command still runing', vim.log.levels.WARN)
    return
  end

  local efm = '%f:%l:%c:%m,%f:%l:%m'

  f.setqflist {}

  local on_event = function(_, data, event)
    if event == 'stdout' or event == 'stderr' then
      if data then
        for _, val in ipairs(data) do
          if val ~= '' then
            f.setqflist({}, 'a', {
              title = pattern,
              lines = { val },
              efm = efm,
            })
          end
        end
      end
    end
    if event == 'exit' then
      if #f.getqflist() == 0 then
        f.setqflist({ { text = 'No Match' } }, 'a')
      end
      api.nvim_command('doautocmd QuickFixCmdPost')
      running_jobid = nil
    end
  end

  running_jobid = f.jobstart(pattern, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdin = 'pipe',
    stdout_buffered = false,
    stderr_buffered = false,
  })
end

-- Stop async job
M.asyncstop = function()
  if running_jobid then
    f.jobstop(running_jobid)
    running_jobid = nil
  end
end

-- Send input to async job
---@param args string
M.input = function(args)
  f.chansend(running_jobid, args .. '\n')
end

return M
