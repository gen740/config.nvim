local M = {}

local ManagerPath = vim.fn.stdpath('data') .. '/run_manager/'

if vim.fn.isdirectory(ManagerPath) == 0 then
  vim.fn.mkdir(ManagerPath, 'p')
end

local get_cmdfile = function()
  local bufnr = vim.fn.bufnr()
  local path = vim.api.nvim_buf_get_name(bufnr)
  return ManagerPath .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')
end

local get_cmd = function()
  local file, err = io.open(get_cmdfile(), 'r')
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

M.register = function()
  local user_cmd = vim.fn.input {
    prompt = 'Enter the cmd: ',
    completion = 'file',
    default = get_cmd(),
  }
  if user_cmd == '' then
    return
  end

  local file, _ = io.open(get_cmdfile(), 'w')
  if file ~= nil then
    file:write(user_cmd)
    file:close()
  end
end

M.run = function()
  local file, err = io.open(get_cmdfile(), 'r')
  if err ~= nil then
    M.register()
    file, _ = io.open(get_cmdfile(), 'r')
  end
  if file ~= nil then
    require('genf.asyncrun').runInConsole(file:read('*a'))
    file:close()
  end
end

M.showCmd = function()
  local cmd = get_cmd()
  if cmd ~= '' then
    vim.api.nvim_err_writeln('No cmd registered')
    return
  end
  vim.api.nvim_echo({ { cmd } }, true, {})
end

return M
