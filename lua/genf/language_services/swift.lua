local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  lmap('n', '<space>rr', function()
    require('genf.asyncrun').asyncrun('swift run')
  end)
end

function M.lsp_config()
  local lsp_util = require('genf.language_services.utils')
  local config = require('lspconfig')['sourcekit']
  config.setup {
    capabilities = lsp_util.capabilities,
    filetypes = { 'swift' },
    cmd = { 'sourcekit-lsp' },
  }
end

return M
