local M = {}

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

function M.lsp_config()
  if pcall(require, 'lspconfig') then
    require('genf.language_services.utils').lsp_setup('dockerls')
  end
end

return M
