local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('swift run')
  end)

  lmap('n', '<space>f', function()
    async_format { 'swift-format', 'format', '-i', vim.fn.expand('%:p') }
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
