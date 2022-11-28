vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

local lsp_utils = require('genf.lsp_utils')

if pcall(require, 'lspconfig') then
  local config = require('lspconfig')['sumneko_lua']
  config.setup {
    capabilities = lsp_utils.capabilities,
    on_attach = lsp_utils.on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = false,
        },
      },
    },
  }
  config.launch()
end
