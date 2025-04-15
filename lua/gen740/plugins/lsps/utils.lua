local capabilities = vim.tbl_extend('keep', require('blink.cmp').get_lsp_capabilities(), {
  window = {
    workDoneProgress = true,
  },
})

return {
  capabilities = capabilities,
  ---@param name string
  lsp_setup = function(name)
    local config = require('lspconfig')[name]
    config.setup {
      capabilities = capabilities,
    }
  end,
}
