local M = {}

---@type vim.SystemObj | nil
local running_job = nil
local api = vim.api
local f = vim.fn

---@class AsyncRunOptions
---@field on_exit? function
---@field efm? string

-- Run command in async mode
---@param cmd string
---@param opt? AsyncRunOptions
M.asyncrun = function(cmd, opt)
  opt = opt or {}
  local on_exit = opt.on_exit or function() end
  local efm = opt.efm or '%-G'
  local command_output = {}
  local cmd_list = {}
  for i, v in ipairs(vim.split(cmd, ' ')) do
    if v ~= '' then
      cmd_list[i] = v
    end
  end

  if running_job then
    vim.notify('Command still runing', vim.log.levels.WARN)
    return
  end
  f.setqflist {} -- Reset qflist

  local on_event = function(_, data)
    local qfwinid = f.getqflist({ winid = 0 }).winid
    if data == nil then
      return
    end
    for _, line in ipairs(vim.split(data, '\n')) do
      line = f.substitute(line, [[\[[0-9;]*m]], [[]], 'g') -- Remove escope codes
      if line ~= '' then
        table.insert(command_output, line)
        f.setqflist({}, 'r', {
          title = cmd,
          lines = command_output,
          efm = efm,
        })
      end
    end
    if qfwinid ~= 0 and qfwinid ~= nil then
      api.nvim_win_set_cursor(qfwinid, { api.nvim_buf_line_count(api.nvim_win_get_buf(qfwinid)), 0 })
    end
  end

  running_job = vim.system(
    cmd_list,
    {
      stdout = vim.schedule_wrap(function(_, data)
        on_event(nil, data)
      end),
      stderr = vim.schedule_wrap(function(_, data)
        on_event(nil, data)
      end),
    },
    -- on_exit
    vim.schedule_wrap(function(status)
      local qfwinid = f.getqflist({ winid = 0 }).winid
      on_exit()
      local end_msg = ''
      if status.signal == 0 then
        end_msg = '<<< successfully exited with code ' .. status.code
      else
        end_msg = '<<< exit with signal ' .. status.signal
      end
      f.setqflist({}, 'a', {
        title = cmd,
        lines = {
          end_msg,
        },
        efm = efm,
      })
      api.nvim_command('doautocmd QuickFixCmdPost')
      if qfwinid ~= 0 and qfwinid ~= nil then
        api.nvim_win_set_cursor(qfwinid, { api.nvim_buf_line_count(api.nvim_win_get_buf(qfwinid)), 0 })
      end
      running_job = nil
    end)
  )
end

---@param pattern string
M.ripgrep = function(pattern, dir)
  dir = dir or '.'
  pattern = 'rg --column ' .. pattern .. ' ' .. dir

  local efm = '%f:%l:%c:%m,%f:%l:%m'

  M.asyncrun(pattern, { efm = efm })
end

-- Stop async job
M.asyncstop = function()
  if running_job then
    running_job:kill(6)
    running_job = nil
  end
end

-- Send input to async job
---@param args string
M.input = function(args)
  if running_job then
    running_job:write(args .. '\n')
  end
end

return M
