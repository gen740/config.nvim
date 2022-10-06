local M = {}

local running_jobid = nil
local is_running = false
local previous_cmd = nil

local has_notify = pcall(require, 'notify')

local function notify(message)
  if has_notify then
    require('notify')(message)
  else
    vim.notify(message)
  end
end

---@param cmd nil|string
function M.asyncrun(cmd)
  -- Repeat if argument is nil
  if cmd == nil then
    if previous_cmd == nil then
      notify('No Previous Command')
      return
    end
    cmd = previous_cmd
  end
  previous_cmd = cmd

  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

  if is_running then
    notify('Command still runing')
    return
  else
    is_running = true
    notify('AsyncRun Start')
  end

  local efm = vim.api.nvim_buf_get_option(bufnr, 'efm')
  if efm == nil or efm == '' then
    efm = '%f:%l:%c:%m,%f:%l:%m'
  end

  vim.fn.setqflist({}, ' ', {
    title = cmd,
    lines = {},
    efm = efm,
  })

  local function on_event(job_id, data, event)
    if event == 'stdout' or event == 'stderr' then
      if data then
        for idx, val in ipairs(data) do
          if val ~= '' then
            vim.list_extend(lines, { val })
          end
        end
        vim.fn.setqflist({}, 'r', {
          title = cmd,
          lines = lines,
          efm = efm,
        })
      end
    end
    if event == 'exit' then
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

function M.ripgrep(cmd)
  local lines = {}
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

  if is_running then
    notify('Command still runing')
    return
  else
    is_running = true
  end

  local efm = vim.api.nvim_buf_get_option(bufnr, 'efm')
  if efm == nil or efm == '' then
    efm = '%f:%l:%c:%m,%f:%l:%m'
  end

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
