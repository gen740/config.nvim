if vim.fn.executable('pyright') == 0 then
  return
end

local lsp_utils = require('genf.language_services.utils')
lsp_utils.lsp_setup('ruff_lsp')
require('lspconfig')['pyright'].setup {
  capabilities = lsp_utils.capabilities,
  settings = {
    python = {
      format = {
        enable = false,
      },
    },
  },
}
