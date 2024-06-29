local M = {}

local ManagerPath = vim.fn.stdpath('data') .. '/run_manager/'

if vim.fn.isdirectory(ManagerPath) == 0 then
  vim.fn.mkdir(ManagerPath, 'p')
end

M.register = function()
  local bufnr = vim.fn.bufnr()
  local path = vim.api.nvim_buf_get_name(bufnr)
  local cmd_file = ManagerPath
    .. vim.fn.substitute(vim.fn.substitute(path, '%', '%%', 'g'), '/', '%', 'g')

  local user_cmd = vim.fn.input('Enter the cmd: ')

  local file, err
end

return M
