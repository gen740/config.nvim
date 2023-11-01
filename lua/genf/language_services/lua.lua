local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<buffer><space>f', function()
    vim.cmd('w')
    require('genf.asyncrun').asyncrun(
      'stylua ' .. vim.fn.expand('%:p'),
      function()
        local current_line = vim.fn.line('.')
        local win_view = vim.fn.winsaveview()
        vim.cmd('e!')
        vim.fn.winrestview(win_view) ---@diagnostic disable-line
        vim.fn.cursor(current_line, 0)
      end,
      true
    )
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
    on_attach = lsp_utils.on_attach,
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
            '/usr/local/share/nvim/runtime',
          },
          checkThirdParty = true,
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
