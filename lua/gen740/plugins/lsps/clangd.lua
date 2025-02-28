require('lspconfig')['clangd'].setup {
  capabilities = require('gen740.plugins.lsps.utils').capabilities,
  cmd = {
    'clangd',
    '-j',
    '14',
    '--enable-config',
    '--offset-encoding=utf-16',
    '-hidden-features',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}
