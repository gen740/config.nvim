local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  lmap('n', '<space>f', function()
    async_format { 'stylua', vim.fn.expand('%:p') }
  end)

  local shiftwidth = 2
  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  local config = require('lspconfig')['lua_ls']

  config.setup {
    capabilities = lsp_utils.capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            '${3rd}/luv/library',
            '${3rd}/luassert/library',
          },
          checkThirdParty = 'Disabled',
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = false,
        },
      },
    },
  }
end

return M
