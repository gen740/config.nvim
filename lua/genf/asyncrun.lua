local M = {}

---@type vim.SystemObj | nil
local running_job = nil

---@class AsyncRunOptions
---@field on_exit? function
---@field efm? string
---@field env? table<string, string>
---@field header? string

-- Run command in async mode
---@param cmd string | string[]
---@param opt? AsyncRunOptions
M.asyncrun = function(cmd, opt)
  opt = opt or {}
  local on_exit = opt.on_exit or function() end
  local efm = opt.efm or '%-G'
  local command_output = (opt.header or '') or ''
  local cmd_list = {}

  if type(cmd) == 'string' then
    for i, v in ipairs(vim.split(cmd, ' ')) do
      if v ~= '' then
        cmd_list[i] = v
      end
    end
  else
    cmd_list = cmd
  end

  if running_job then
    vim.notify('Command still runing', vim.log.levels.WARN)
    return
  end
  vim.fn.setqflist {} -- Reset qflist

  local on_event = function(data)
    local qfwinid = vim.fn.getqflist({ winid = 0 }).winid
    if data == nil then
      return
    end
    command_output = vim.fn.substitute(command_output .. data, [[\[[0-9;]*m]], [[]], 'g')
    vim.fn.setqflist({}, 'r', {
      title = cmd,
      lines = vim.split(vim.fn.substitute(command_output, '\n*$', '', 'g'), '\n'),
      efm = efm,
    })
    if qfwinid ~= 0 and qfwinid ~= nil then
      vim.api.nvim_win_set_cursor(qfwinid, { vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(qfwinid)), 0 })
    end
  end

  running_job = vim.system(
    cmd_list,
    {
      stdout = vim.schedule_wrap(function(_, data)
        on_event(data)
      end),
      stderr = vim.schedule_wrap(function(_, data)
        on_event(data)
      end),
      stdin = true,
      env = opt.env,
    },
    -- on_exit
    vim.schedule_wrap(function(status)
      local qfwinid = vim.fn.getqflist({ winid = 0 }).winid
      on_exit()
      local end_msg = ''
      if status.signal == 0 then
        end_msg = '<<< successfully exited with code ' .. status.code
      else
        end_msg = '<<< exit with signal ' .. status.signal
      end
      vim.fn.setqflist({}, 'a', {
        title = cmd,
        lines = {
          end_msg,
        },
        efm = efm,
      })
      vim.api.nvim_command('doautocmd QuickFixCmdPost')
      if qfwinid ~= 0 and qfwinid ~= nil then
        vim.api.nvim_win_set_cursor(qfwinid, { vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(qfwinid)), 0 })
      end
      running_job = nil
    end)
  )
end

---@param pattern string[]
M.ripgrep = function(pattern)
  -- dir = dir or '.'
  -- pattern = 'rg --column ' .. pattern .. ' ' .. dir
  table.insert(pattern, 1, 'rg')
  table.insert(pattern, 2, '--column')
  local efm = '%f:%l:%c:%m,%f:%l:%m'
  M.asyncrun(pattern, { efm = efm, header = '[Rg] ' .. vim.inspect(pattern) .. '\n' })
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
