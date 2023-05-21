local M = {}

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

function M.lsp_config()
  print('Foo')
  require('genf.language_services.utils').lsp_setup('tsserver')
end

return M
