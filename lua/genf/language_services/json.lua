local M = {}

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  local config = require('lspconfig')['jsonls']
  config.setup {
    capabilities = lsp_utils.capabilities,
    on_attach = lsp_utils.on_attach,
    filetypes = { 'json', 'jsonc' },
    settings = {
      json = {
        schemas = {
          { fileMatch = { 'package.json' }, url = 'https://json.schemastore.org/package.json' },
          { fileMatch = { 'tsconfig*.json' }, url = 'https://json.schemastore.org/tsconfig.json' },
        },
      },
    },
  }
end

return M
