if vim.fn.executable('clangd') == 0 then
  return
end

local lsp_util = require('genf.language_services.utils')
local config = require('lspconfig')['clangd']

config.setup {
  capabilities = lsp_util.capabilities,
  cmd = {
    'clangd',
    '-j',
    '16',
    '--enable-config',
    '--offset-encoding=utf-16',
    '-hidden-features',
  },
}
