local M = {}

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  local config = require('lspconfig')['taplo']
  config.setup {
    capabilities = lsp_utils.capabilities,
  }
end

return M
