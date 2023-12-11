local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('task compile')
  end)

  lmap('n', '<m-g>', function()
    require('genf.asyncrun').asyncrun('task cmake')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<m-e>', function()
    require('genf.asyncrun').asyncrun([[task ]] .. vim.fn.expand('%:t:r'))
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  if pcall(require, 'lspconfig') then
    local lsp_util = require('genf.language_services.utils')
    local config = require('lspconfig')['clangd']

    config.setup {
      capabilities = lsp_util.capabilities,
      -- filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
      cmd = {
        '/usr/local/opt/llvm/bin/clangd',
        '-j',
        '16',
        '--enable-config',
        '--offset-encoding=utf-16',
      },
    }
  end
end

return M
