local M = {}

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt.commentstring = '# %s'
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('mojo')
end

return M
