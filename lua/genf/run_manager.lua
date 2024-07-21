local M = {}

local managerPath = vim.fn.stdpath('data') .. '/run_manager/'
local gitManagerPath = vim.fn.stdpath('data') .. '/run_manager_git/'
local buildManagerPath = vim.fn.stdpath('data') .. '/build_manager/'
local gitBuildManagerPath = vim.fn.stdpath('data') .. '/build_manager_git/'

if vim.fn.isdirectory(buildManagerPath) == 0 then
  vim.fn.mkdir(buildManagerPath, 'p')
end

if vim.fn.isdirectory(buildManagerPath) == 0 then
  vim.fn.mkdir(gitBuildManagerPath, 'p')
end

if vim.fn.isdirectory(managerPath) == 0 then
  vim.fn.mkdir(managerPath, 'p')
end

if vim.fn.isdirectory(gitManagerPath) == 0 then
  vim.fn.mkdir(gitManagerPath, 'p')
end

---@param build boolean
---@param git boolean?
local get_cmdfile = function(build, git)
  if git then
    local path = vim.fn.execute('!git rev-parse --show-toplevel')

    if build then
      return gitBuildManagerPath
        .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
        .. '.json'
    else
      return gitManagerPath
        .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
        .. '.json'
    end
  else
    local bufnr = vim.fn.bufnr()
    local path = vim.api.nvim_buf_get_name(bufnr)

    if build then
      return buildManagerPath
        .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
        .. '.json'
    else
      return managerPath
        .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
        .. '.json'
    end
  end
end

---@param build boolean
---@param git boolean?
local get_cmdfile_data = function(build, git)
  local file, err = io.open(get_cmdfile(build, git), 'r')
  if err ~= nil then
    return ''
  end
  if file ~= nil then
    local cmd = file:read('*a')
    file:close()
    return cmd
  end
  return ''
end

---@class RunCmd
---@field cmd string[]
---@field cwd string?
---@field env table<string, string>?

---@param json string
---@return RunCmd?
local decodeJson = function(json)
  local status, result = pcall(vim.fn.json_decode, json)
  if not status then
    return nil
  end
  if result.cmd == nil then
    return nil
  end

  return result
end

---@param build boolean
---@param git boolean?
M.register = function(build, git)
  git = git or false
  local file_name = get_cmdfile(build, git)

  local bufnr = vim.api.nvim_create_buf(false, false)

  vim.api.nvim_buf_set_name(bufnr, file_name)

  vim.api.nvim_buf_call(bufnr, function()
    vim.cmd('edit')
  end)

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  if table.concat(lines, '') == '' then
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
      vim.json.encode {
        ['$schema'] = 'file://' .. vim.fn.stdpath('config') .. '/schema/build_manager.json',
        cmd = { 'echo', 'build' },
      },
    })

    vim.api.nvim_buf_call(bufnr, function()
      vim.cmd('%!jq')
    end)
  end

  local ui_info = vim.api.nvim_list_uis()[1]

  local winid = vim.api.nvim_open_win(bufnr, true, {
    relative = 'editor',
    row = math.floor(ui_info.height * 0.2),
    col = math.floor(ui_info.width * 0.2),
    width = math.floor(ui_info.width * 0.6),
    height = math.floor(ui_info.height * 0.6),
    title = ' Build Manager ',
    title_pos = 'center',
    border = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' },
  })

  vim.api.nvim_create_augroup('BuildManagerAutoClose', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = 'BuildManagerAutoClose',
    callback = function(arg)
      if arg.buf == bufnr then
        local bufData = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local cmd = decodeJson(table.concat(bufData, '\n'))
        if cmd == nil then
          vim.notify('Invalid JSON', 'error')
        else
          vim.api.nvim_win_close(winid, true)
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      end
    end,
  })
end

---@param build boolean
---@param git boolean?
M.run = function(build, git)
  local cmd = decodeJson(get_cmdfile_data(build, git))
  if cmd == nil then
    vim.notify('Invalid JSON', 'error')
    return
  end
  if build then
    require('genf.toggleshell').Quickfix()
    require('genf.asyncrun').asyncbuild(cmd.cmd, {
      cwd = cmd.cwd,
      env = cmd.env,
    })
  else
    require('genf.toggleshell').Console()
    require('genf.asyncrun').runInConsole(table.concat(cmd.cmd, ' '), {
      cwd = cmd.cwd,
      env = cmd.env,
    })
  end
end

return M
