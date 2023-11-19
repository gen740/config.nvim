local M = {}

function M.setup()
  vim.opt_local.cursorline = false
  vim.opt_local.number = true
  vim.opt_local.relativenumber = false
  vim.opt_local.colorcolumn = '0'
  vim.opt_local.buflisted = false
end

return M
