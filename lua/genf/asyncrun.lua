local M = {}

---@class RunningJobs
---@field qflist vim.SystemObj | nil
---@field loclist vim.SystemObj[] | nil
---@field headless vim.SystemObj[] | nil

---@type RunningJobs
local running_job = nil

---@param run_type "qflist" | "loclist" | "headless"
local checkRunning = function(run_type)
  if running_job == nil then
    return false
  end
  if run_type == 'qflist' then
    return running_job.qflist ~= nil
  elseif run_type == 'loclist' then
    return running_job.loclist[vim.api.nvim_get_current_win()] ~= nil
  elseif run_type == 'headless' then
    return running_job.headless ~= nil
  end
  return false
end

---@param run_type "qflist" | "loclist" | "headless"
---@param job vim.SystemObj | nil
local assignJob = function(run_type, job)
  if running_job == nil then
    running_job = {}
  end
  if run_type == 'qflist' then
    running_job.qflist = job
  elseif run_type == 'loclist' then
    if running_job.loclist == nil then
      running_job.loclist = {}
    end
    running_job.loclist[vim.api.nvim_get_current_win()] = job
  elseif run_type == 'headless' then
    if running_job.headless == nil then
      running_job.headless = {}
    end
    -- Headless job is not assigned to any global variable
    -- table.insert(running_job.headless, job)
  end
end

---@param run_type "qflist" | "loclist" | "headless"
---@param winid integer
---@param list string[]
---@param action string
---@param what table
local setQflist = function(run_type, winid, list, action, what)
  if running_job == nil then
    return
  end
  if run_type == 'qflist' then
    vim.fn.setqflist(list, action, what)
  elseif run_type == 'loclist' then
    vim.fn.setloclist(winid, list, action, what)
  end
end

---@class AsyncRunOptions
---@field on_exit? function
---@field efm? string
---@field env? table<string, string>
---@field cwd? string

-- Run command in async mode
---@param cmd string[]
---@param run_type "qflist" | "loclist" | "headless"
---@param opts? AsyncRunOptions
M.asyncRun = function(cmd, run_type, opts)
  opts = opts or {}

  opts.efm = opts.efm or '%-G'

  if checkRunning(run_type) then
    vim.notify('Command still runing', vim.log.levels.WARN)
    return
  end

  if run_type == 'qflist' then
    vim.fn.setqflist({}, 'r', {
      title = cmd,
      lines = {},
      efm = opts.efm,
    })
  end

  local tail_text = ''
  local current_win = vim.api.nvim_get_current_win()
  local on_event = function(data)
    if data == nil then
      return
    end
    -- remove ascii escape code
    data = data:gsub('\027%[[%d;]+m', '')
    local data_current = tail_text .. data
    if data_current:sub(-1) == '\n' then
      tail_text = ''
    else
      local last_line = vim.split(data_current, '\n')
      tail_text = last_line[#last_line]
      table.remove(last_line, #last_line)
      data_current = table.concat(last_line, '\n')
    end
    setQflist(run_type, current_win, {}, 'a', {
      lines = vim.split(vim.fn.substitute(data_current, '\n*$', '', 'g'), '\n'),
      efm = nil,
    })
    vim.cmd('redraw!')
  end

  assignJob(
    run_type,
    vim.system(
      cmd,
      {
        stdout = vim.schedule_wrap(function(_, data)
          on_event(data)
        end),
        stderr = vim.schedule_wrap(function(_, data)
          on_event(data)
        end),
        stdin = true,
        env = opts.env,
        cwd = opts.cwd,
      },
      vim.schedule_wrap(function(status)
        local end_msg = ''
        if status.signal == 0 then
          end_msg = '<<< successfully exited with code ' .. status.code
        else
          end_msg = '<<< exit with signal ' .. status.signal
        end
        setQflist(run_type, current_win, {}, 'a', {
          title = cmd,
          lines = {
            end_msg,
          },
          efm = opts.efm,
        })
        vim.api.nvim_command('doautocmd QuickFixCmdPost')
        assignJob(run_type, nil)
      end)
    )
  )
end

return M
