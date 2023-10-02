local M = {}

local running_jobid = nil
local is_running = false

---@param message string
local function notify(message)
  local has_notify = pcall(require, 'notify')
  if has_notify then
    require('notify')(message)
  else
    vim.notify(message)
  end
end

---@param cmd nil|string
---@param on_exit nil|function
---@param silent nil|boolean
function M.asyncrun(cmd, on_exit, silent)
  -- Repeat if argument is nil
  if cmd == nil then
    notify('Error')
  end

  on_exit = on_exit or function() end
  silent = silent or false

  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = nil

  local efm = vim.api.nvim_buf_get_option(bufnr, 'efm')
  if efm == nil or efm == '' then
    efm = '%f:%l:%c:%m,%f:%l:%m'
  end

  if not silent then
    qfwinid = vim.fn.getqflist({ winid = winnr }).winid
    if is_running then
      M.asyncstop()
      return
    else
      is_running = true
      notify('AsyncRun Start')
    end

    vim.fn.setqflist({}, ' ', {
      title = cmd,
      lines = {},
      efm = efm,
    })
  end

  local function on_event(job_id, data, event)
    if (event == 'stdout' or event == 'stderr') and not silent then
      if data then
        for idx, val in ipairs(data) do
          if val ~= '' then
            val = vim.fn.substitute(val, [[\[[0-9;]*m]], [[]], 'g')
            vim.list_extend(lines, { val })
          end
        end
        vim.fn.setqflist({}, 'r', {
          title = cmd,
          lines = lines,
          efm = efm,
        })
        vim.fn.win_execute(qfwinid, ':norm G')
      end
    end
    if event == 'exit' then
      on_exit()
      if not silent then
        notify('AsyncRun Done')
        table.insert(
          lines,
          '  ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ AsyncRun Done!! ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ '
        )
        vim.fn.setqflist({}, 'r', {
          title = cmd,
          lines = lines,
          efm = efm,
        })
        vim.api.nvim_command('doautocmd QuickFixCmdPost')
        vim.fn.win_execute(qfwinid, ':norm G')
      end
      is_running = false
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

--@param cmd string
function M.ripgrep(cmd)
  M.asyncstop()
  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

  cmd = 'rg --column ' .. cmd .. ' .'

  if is_running then
    notify('Command still runing')
    return
  else
    is_running = true
  end

  local efm = '%f:%l:%c:%m,%f:%l:%m'

  vim.fn.setqflist({}, ' ', {
    title = cmd,
    lines = {},
    efm = efm,
  })

  local function on_event(job_id, data, event)
    if event == 'stdout' or event == 'stderr' then
      if data then
        for idx, val in ipairs(data) do
          -- notify(val)
          if val ~= '' then
            vim.list_extend(lines, { val })
          end
        end
        vim.fn.setqflist({}, ' ', {
          title = cmd,
          lines = lines,
          efm = efm,
        })
        -- vim.api.nvim_command("doautocmd QuickFixCmdPost")
      end
    end
    if event == 'exit' then
      vim.api.nvim_command('doautocmd QuickFixCmdPost')
      notify('Done')
      is_running = false
      running_jobid = nil
    end
  end

  running_jobid = vim.fn.jobstart(cmd, {
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
    stdin = 'pipe',
    stdout_buffered = false,
    stderr_buffered = false,
  })
end

function M.asyncstop()
  if running_jobid then
    vim.fn.jobstop(running_jobid)
  end
end

---@param args string
function M.input(args)
  vim.fn.chansend(running_jobid, args .. '\n')
end

return M
