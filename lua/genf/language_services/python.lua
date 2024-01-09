local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<space>f', function()
    -- async_format('black ' .. vim.fn.expand('%:p') .. ';' .. 'isort ' .. vim.fn.expand('%:p'))
    async_format('ruff format ' .. vim.fn.expand('%:p'))
  end)

  local shiftwidth = 4

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
  vim.opt_local.colorcolumn = '100'

  vim.cmd('compiler python')
end
local lsp_utils = require('genf.language_services.utils')

function M.lsp_config()
  local config = require('lspconfig')['pyright']
  config.setup {
    capabilities = lsp_utils.capabilities,
    settings = {
      python = {
        format = {
          enable = false,
        },
        venvPath = '/Users/gen/.config/pyenv/versions',
      },
    },
  }
end

function M.dap_config()
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable',
    command = '/Users/gen/.config/pyenv/shims/python3',
    args = { '-m', 'debugpy.adapter' },
  }
  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch file',
      program = '${file}', -- This configuration will launch the current file if used.
      pythonPath = '/Users/gen/.config/pyenv/shims/python3',
    },
  }
end

return M
