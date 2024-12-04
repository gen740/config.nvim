if vim.fn.executable('clangd') == 0 then
  return
end

require('lspconfig')['clangd'].setup {
  capabilities = require('genf.plugins.lsps.utils').capabilities,
  cmd = {
    'clangd',
    '-j',
    '16',
    '--enable-config',
    '--offset-encoding=utf-16',
    '-hidden-features',
  },
}
