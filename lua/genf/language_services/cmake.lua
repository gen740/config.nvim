local M = {}

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.cmd('compiler cmake')
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('cmake', true)
end

return M
