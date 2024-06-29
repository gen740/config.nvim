local M = {}

---@type vim.SystemObj | nil
local running_job = nil

---@class AsyncRunOptions
---@field on_exit? function
---@field efm? string
---@field env? table<string, string>

-- Run command in async mode
---@param cmd string | string[]
---@param opt? AsyncRunOptions
M.asyncbuild = function(cmd, opt)
  opt = opt or {}
  local on_exit = opt.on_exit or function() end
  local efm = opt.efm or '%-G'
  local tail_text = ''
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

M.openConsole = function()
  local existing_bufnr = vim.fn.bufnr('Console')
  if existing_bufnr ~= -1 then
    return existing_bufnr
  end

  require('genf.toggleshell').ToggleQF(true)

  local bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_name(bufnr, 'Console')
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = bufnr })
  vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = bufnr })
  vim.api.nvim_set_option_value('swapfile', false, { buf = bufnr })
  vim.api.nvim_set_option_value('filetype', 'console', { buf = bufnr })
  -- vim.api.nvim_set_option_value('modifiable', false, { buf = bufnr })

  local current_win = vim.api.nvim_get_current_win()
  local new_win = vim.api.nvim_open_win(bufnr, false, {
    split = 'right',
    win = current_win,
  })

  vim.api.nvim_set_option_value('number', false, { win = new_win })
  vim.api.nvim_set_option_value('relativenumber', false, { win = new_win })
  return bufnr
end

---@class ConsoleRunOptions
---@field env? table<string, string>

---@param cmd string
---@param opt ConsoleRunOptions
M.runInConsole = function(cmd, opt)
  local bufnr = require('genf.toggleshell').Console()

  local jobid = -1

  local chanid = vim.api.nvim_open_term(bufnr, {
    on_input = function(_, _, _, data)
      if jobid ~= -1 then
        vim.fn.chansend(jobid, data)
      end
    end,
  })

  jobid = vim.fn.jobstart(cmd, {
    pty = true,
    env = opt.env,
    on_stdout = function(_, data, _)
      vim.api.nvim_chan_send(chanid, vim.fn.join(data, '\n'))
      local winid = vim.fn.bufwinid(bufnr)
      if vim.fn.bufwinid(bufnr) ~= -1 then
        vim.api.nvim_win_set_cursor(winid, { vim.api.nvim_buf_line_count(bufnr), 0 })
      end
    end,
    on_stderr = function(_, data, _)
      vim.api.nvim_chan_send(chanid, vim.fn.join(data, '\n'))
      local winid = vim.fn.bufwinid(bufnr)
      if vim.fn.bufwinid(bufnr) ~= -1 then
        vim.api.nvim_win_set_cursor(winid, { vim.api.nvim_buf_line_count(bufnr), 0 })
      end
    end,
    on_exit = function(_, status, _)
      vim.api.nvim_chan_send(chanid, '<<< Exit with code ' .. status)
      jobid = -1
    end,
  })
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
