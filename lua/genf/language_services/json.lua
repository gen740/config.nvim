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
    filetypes = { 'json', 'jsonc' },
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { 'package.json' },
            url = 'https://json.schemastore.org/package.json',
          },
          {
            fileMatch = { 'tsconfig*.json' },
            url = 'https://json.schemastore.org/tsconfig.json',
          },
          {
            fileMatch = { '.luarc.json' },
            url = 'https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json',
          },
          {
            fileMatch = { 'pyrightconfig.json' },
            url = 'https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json',
          },
          {
            fileMatch = { 'biome.json' },
            url = 'https://biomejs.dev/schemas/1.6.1/schema.json',
          },
          {
            fileMatch = { 'appsscript.json' },
            url = 'https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/appsscript.json',
          },
          {
            fileMatch = { 'deno.json' },
            url = 'https://raw.githubusercontent.com/denoland/deno/v1.41.0/cli/schemas/config-file.v1.json',
          }
        },
      },
    },
  }
end

return M
