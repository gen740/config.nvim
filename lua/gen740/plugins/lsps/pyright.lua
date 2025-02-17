require('lspconfig')['pyright'].setup {
  capabilities = require('gen740.plugins.lsps.utils').capabilities,
  settings = {
    python = {
      format = {
        enable = false,
      },
    },
  },
}
