local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  -- vim.keymap.set('n', '<m-c>', function()
  --   require('genf.asyncrun').asyncrun('task compile')
  -- end)

  vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  local shiftwidth = 4

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth

  vim.cmd('compiler python')
end
local lsp_utils = require('genf.language_services.utils')

function M.lsp_config()
  local config = require('lspconfig')['pyright']
  config.setup {
    capabilities = lsp_utils.capabilities,
    on_attach = lsp_utils.on_attach,
    settings = {
      python = {
    --     analysis = {
    --       useLibraryCodeForTypes = true,
    --       -- diagnosticMode = 'openFilesOnly',
    --       diagnosticSeverityOverrides = {
    --         -- reportGeneralTypeIssues = 'none',
    --         -- stubPath = '~/.local/tools/python-type-stubs',
    --       },
    --     },
        format = {
          enable = false,
        },
        venvPath = '/Users/gen/.pyenv/versions/3.10.13/envs/',
      },
    },
  }

  -- local config = require('lspconfig')['pylsp']
  -- config.setup {
  --   capabilities = lsp_utils.capabilities,
  --   on_attach = lsp_utils.on_attach,
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --
  --         autopep8 = {
  --
  --           enabled = false,
  --         },
  --       },
  --     },
  --   },
  -- }
end

function M.dap_config()
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable',
    command = vim.fn.system('which python3'),
    args = { '-m', 'debugpy.adapter' },
  }
  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch file',
      program = '${file}', -- This configuration will launch the current file if used.
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/Users/fujimotogen/.pyenv/shims/python3'
        end
      end,
    },
  }
end

return M
