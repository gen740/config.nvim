if vim.fn.executable('pyright') == 0 then
  return
end

require('lspconfig')['pyright'].setup {
  capabilities = require('genf.plugins.lsps.utils').capabilities,
  settings = {
    python = {
      format = {
        enable = false,
      },
    },
  },
}
