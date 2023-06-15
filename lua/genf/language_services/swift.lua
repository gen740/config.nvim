local M = {}

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  vim.keymap.set('n', '<m-e>', function()
    require('genf.asyncrun').asyncrun('swift ' .. vim.fn.expand('%'))
  end)
end

function M.lsp_config()
  if pcall(require, 'lspconfig') then
    local lsp_util = require('genf.language_services.utils')
    local config = require('lspconfig')['sourcekit']
    config.setup {
      capabilities = lsp_util.capabilities,
      on_attach = lsp_util.on_attach,
      filetypes = { 'swift' },
      -- cmd = { 'xcrun', '--toolchain', 'swift', 'sourcekit-lsp', '--log-level=warning' },
      cmd = { 'sourcekit-lsp' },
    }
  end
end

-- function M.dap_config()
-- end

return M
