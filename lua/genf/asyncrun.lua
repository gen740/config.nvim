local M = {}

local running_jobid = nil

-- Emit message with vim-notify plugin
---@param message string
local notify = function(message)
  local has_notify = pcall(require, 'notify')
  if has_notify then
    require('notify')(message)
  else
    vim.notify(message)
  end
end

-- Run command in async mode
---@param cmd nil|string
---@param on_exit nil|function
---@param silent nil|boolean
M.asyncrun = function(cmd, on_exit, silent)
  if cmd == nil then
    error('AsyncRun: cmd is nil')
  end

  on_exit = on_exit or function() end
  silent = silent or false

  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

  local efm = vim.api.nvim_get_option_value('efm', { buf = bufnr })
  if efm == nil or efm == '' then
    efm = '%f:%l:%c:%m,%f:%l:%m'
  end

  if not silent then
    if running_jobid then
      notify('Command still runing')
      return
    else
      notify('AsyncRun Start')
    end
    vim.fn.setqflist {}
  end

  local on_event = function(_, data, event)
    if (event == 'stdout' or event == 'stderr') and not silent then
      if data then
        for _, val in ipairs(data) do
          if val ~= '' then
            val = vim.fn.substitute(val, [[\[[0-9;]*m]], [[]], 'g')
            vim.fn.setqflist({}, 'a', {
              title = cmd,
              lines = { val },
              efm = efm,
            })
          end
        end
        vim.fn.win_execute(qfwinid, ':norm G')
      end
    end
    if event == 'exit' then
      on_exit()
      if not silent then
        notify('AsyncRun Done')
        vim.fn.setqflist({}, 'a', {
          title = cmd,
          lines = {
            '  ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ AsyncRun Done!! ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ',
          },
          efm = efm,
        })
        vim.api.nvim_command('doautocmd QuickFixCmdPost')
        vim.fn.win_execute(qfwinid, ':norm G')
      end
      running_jobid = nil
    end
  end

  running_jobid = vim.fn.jobstart(cmd, {
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

  vim.fn.setqflist {}

  local on_event = function(_, data, event)
    if event == 'stdout' or event == 'stderr' then
      if data then
        for _, val in ipairs(data) do
          if val ~= '' then
            vim.fn.setqflist({}, 'a', {
              title = pattern,
              lines = { val },
              efm = efm,
            })
          end
        end
      end
    end
    if event == 'exit' then
      if #vim.fn.getqflist() == 0 then
        vim.fn.setqflist({ { text = 'No Match' } }, 'a')
      end
      vim.api.nvim_command('doautocmd QuickFixCmdPost')
      notify('Done')
      running_jobid = nil
    end
  end

  running_jobid = vim.fn.jobstart(pattern, {
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
    vim.fn.jobstop(running_jobid)
    running_jobid = nil
  end
end

-- Send input to async job
---@param args string
M.input = function(args)
  vim.fn.chansend(running_jobid, args .. '\n')
end

return M
