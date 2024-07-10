local M = {}

local ManagerPath = vim.fn.stdpath('data') .. '/run_manager/'
local GitManagerPath = vim.fn.stdpath('data') .. '/run_manager_git/'

if vim.fn.isdirectory(ManagerPath) == 0 then
  vim.fn.mkdir(ManagerPath, 'p')
end

if vim.fn.isdirectory(GitManagerPath) == 0 then
  vim.fn.mkdir(GitManagerPath, 'p')
end

---@param git boolean
local get_cmdfile = function(git)
  if git then
    local path = vim.fn.execute('!git rev-parse --show-toplevel')
    return GitManagerPath
      .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
  else
    local bufnr = vim.fn.bufnr()
    local path = vim.api.nvim_buf_get_name(bufnr)
    return ManagerPath .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
  end
end

---@param git boolean
local get_cmd = function(git)
  local file, err = io.open(get_cmdfile(git), 'r')
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

---@param git boolean?
M.register = function(git)
  git = git or false
  local user_cmd = vim.fn.input {
    prompt = 'Enter the cmd: ',
    completion = 'file',
    default = get_cmd(git),
  }
  if user_cmd == '' then
    return
  end

  local file, _ = io.open(get_cmdfile(git), 'w')
  if file ~= nil then
    file:write(user_cmd)
    file:close()
  end
end

---@param git boolean?
M.run = function(git)
  git = git or false

  local file, err = io.open(get_cmdfile(git), 'r')
  if err ~= nil then
    M.register(git)
    file, _ = io.open(get_cmdfile(git), 'r')
  end
  if file ~= nil then
    local cmd = file:read('*a')
    if cmd ~= nil then
      require('genf.asyncrun').runInConsole(file:read('*a'))
    else
      vim.notify('Invalid file name', vim.log.levels.WARN)
    end
    file:close()
  end
end

---@param git boolean?
M.showCmd = function(git)
  git = git or false

  local cmd = get_cmd(git)
  if cmd ~= '' then
    vim.api.nvim_err_writeln('No cmd registered')
    return
  end
  vim.api.nvim_echo({ { cmd } }, true, {})
end

return M
