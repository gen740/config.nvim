local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt.commentstring = '// %s'

  -- lmap('n', '<m-r>', function()
  --   require('genf.asyncrun').asyncrun('swift run')
  -- end)

  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task run')
  end)

  lmap('n', '<m-t>', function()
    require('genf.asyncrun').asyncrun('task test')
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('task build', {
      efm = '%f:%l:%c: %trror: %m,%f:%l:%c: %tarning: %m',
    })
  end)

  lmap('n', '<m-g>', function()
    require('genf.asyncrun').asyncrun('task cmake')
  end)

  lmap('n', '<space>f', function()
    async_format({ 'swift-format', 'format', '-i', vim.fn.expand('%:p') }, true)
  end)
end

function M.lsp_config()
  local lsp_util = require('genf.language_services.utils')
  local config = require('lspconfig')['sourcekit']
  config.setup {
    capabilities = lsp_util.capabilities,
    filetypes = { 'swift' },
    cmd = { 'xcrun', 'sourcekit-lsp', '-index-store-path', './.build/index' },
  }
end

return M
