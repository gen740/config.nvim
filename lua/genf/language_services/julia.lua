local M = {}


function M.setup()

  local shiftwidth = 2
  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('julials')
end

return M
