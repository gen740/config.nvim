local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  local efm = ''
  efm = efm .. '%E%trror: %m,%C --> %f:%l:%c,%Z,'
  efm = efm .. '%E%trror[E%n]: %m,%C --> %f:%l:%c,%Z,'
  efm = efm .. '%W%tarning: %m,%C  --> %f:%l:%c,%Z,'

  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('cargo run', {
      efm = efm,
    })
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('cargo build', {
      efm = efm,
    })
  end)

  lmap('n', '<m-t>', function()
    vim.cmd('copen')
    vim.cmd('wincmd k')
    require('genf.asyncrun').asyncrun('cargo test')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.makeprg = 'cargo'

  vim.cmd('compiler cargo')
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = lsp_utils.capabilities,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        checkOnSave = {
          allFeatures = true,
          command = 'clippy',
          extraArgs = { '--no-deps' },
        },
        procMacro = {
          enable = true,
          ignored = {
            ['async-trait'] = { 'async_trait' },
            ['napi-derive'] = { 'napi' },
            ['async-recursion'] = { 'async_recursion' },
          },
        },
      },
    },
  }
end

return M
