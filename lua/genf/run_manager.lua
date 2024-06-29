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

M.register = function()
  local user_cmd = vim.fn.input('Enter the cmd: ')

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
  local file, err = io.open(get_cmdfile(), 'r')
  if err ~= nil then
    vim.api.nvim_err_writeln('No cmd registered')
  end
  if file ~= nil then
    vim.api.nvim_echo({ { file:read('*a') } }, true, {})
    file:close()
  end
end

return M
