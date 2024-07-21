local M = {}

---@type vim.SystemObj | nil
local running_job = nil

---@class AsyncRunOptions
---@field on_exit? function
---@field efm? string
---@field env? table<string, string>
---@field cwd? string

-- Run command in async mode
---@param cmd string[]
---@param opt? AsyncRunOptions
M.asyncbuild = function(cmd, opt)
  opt = opt or {}

  local on_exit = opt.on_exit or function() end
  local efm = opt.efm or '%-G'
  local tail_text = ''

  if running_job then
    vim.notify('Command still runing', vim.log.levels.WARN)
    return
  end

  vim.fn.setqflist({}, 'r', {
    title = cmd,
    lines = {},
    efm = efm,
  }) -- Reset qflist

  local on_event = function(data)
    local qfwinid = vim.fn.getqflist({ winid = 0 }).winid
    if data == nil then
      return
    end
    local data_current = tail_text .. data
    if data_current:sub(-1) == '\n' then
      tail_text = ''
    else
      local last_line = vim.split(data_current, '\n')
      tail_text = last_line[#last_line]
      table.remove(last_line, #last_line)
      data_current = table.concat(last_line, '\n')
    end

    vim.fn.setqflist({}, 'a', {
      lines = vim.split(vim.fn.substitute(data_current, '\n*$', '', 'g'), '\n'),
      efm = nil,
    })

    vim.cmd('redraw!')
    if qfwinid ~= 0 and qfwinid ~= nil then
      vim.api.nvim_win_set_cursor(
        qfwinid,
        { vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(qfwinid)), 0 }
      )
    end
  end

  running_job = vim.system(
    cmd,
    {
      stdout = vim.schedule_wrap(function(_, data)
        on_event(data)
      end),
      stderr = vim.schedule_wrap(function(_, data)
        on_event(data)
      end),
      stdin = true,
      env = opt.env,
      cwd = opt.cwd,
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
        vim.api.nvim_win_set_cursor(
          qfwinid,
          { vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(qfwinid)), 0 }
        )
      end
      running_job = nil
    end)
  )
end

-- Stop async job
M.asyncBuildStop = function()
  if running_job then
    running_job:kill(6)
    running_job = nil
  end
end

---@type integer
local console_running_jobid = -1

---@class ConsoleRunOptions
---@field env? table<string, string>
---@field cwd string

---@param cmd string
---@param opt ConsoleRunOptions?
M.runInConsole = function(cmd, opt)
  local bufnr = require('genf.toggleshell').Console()

  if console_running_jobid ~= -1 then
    vim.notify('Console is running', vim.log.levels.ERROR)
    return
  end

  local chanid = vim.api.nvim_open_term(bufnr, {
    on_input = function(_, _, _, data)
      if console_running_jobid ~= -1 then
        vim.fn.chansend(console_running_jobid, data)
      end
    end,
  })

  local cmd_env = nil
  if opt == nil then
    cmd_env = nil
  else
    cmd_env = opt.env
  end

  local on_data = function(_, data, _)
    vim.api.nvim_chan_send(chanid, vim.fn.join(data, '\n'))
    local winid = vim.fn.bufwinid(bufnr)
    if vim.fn.bufwinid(bufnr) ~= -1 then
      vim.api.nvim_win_set_cursor(winid, { vim.api.nvim_buf_line_count(bufnr), 0 })
    end
  end
  local cwd = nil
  if opt ~= nil then
    cwd = opt.cwd
  end

  console_running_jobid = vim.fn.jobstart(cmd, {
    pty = true,
    env = cmd_env,
    cwd = cwd,
    on_stdout = on_data,
    on_exit = function(_, status, _)
      vim.api.nvim_chan_send(chanid, '<<< Exit with code ' .. status)
      console_running_jobid = -1
    end,
  })
end

return M
