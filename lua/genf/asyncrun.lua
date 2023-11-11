local M = {}

local running_jobid = nil
local api = vim.api
local f = vim.fn

-- Emit message with vim-notify plugin
---@param message string
local notify = function(message)
  if pcall(require, 'notify') then
    require('notify')(message)
  else
    vim.notify(message)
  end
end

-- Run command in async mode
---@param cmd string
---@param on_exit nil|function
---@param silent nil|boolean
M.asyncrun = function(cmd, on_exit, silent)
  on_exit = on_exit or function() end
  silent = silent or false

  local efm = '%-G' -- disable error format

  if not silent then
    if running_jobid then
      notify('Command still runing')
      return
    else
      notify('AsyncRun Start')
    end
  end

  f.setqflist {} -- Reset qflist

  local on_event = function(_, data, event)
    local qfwinid = f.getqflist({ winid = 0 }).winid
    if (event == 'stdout' or event == 'stderr') and not silent then
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
      if not silent then
        notify('AsyncRun Done')
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
      end
      running_jobid = nil
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
    notify('Command still runing')
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
      notify('Done')
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
