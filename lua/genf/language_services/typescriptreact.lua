local M = {}

function M.setup()
  local shiftwidth = 2

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

return M
