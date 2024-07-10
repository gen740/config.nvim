local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  local efm = ''
  efm = efm .. '  File "%f"\\, line %l%.%#,'

  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncbuild('task run', {
      efm = efm,
    })
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncBuildStop()
  end)

  local shiftwidth = 4

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth

  vim.cmd('compiler python')
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  lsp_utils.lsp_setup('ruff_lsp')
  require('lspconfig')['pyright'].setup {
    capabilities = lsp_utils.capabilities,
    settings = {
      python = {
        format = {
          enable = false,
        },
      },
    },
  }
end

function M.dap_config()
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable',
    command = '/Users/gen/.rye/shims/python3',
    args = { '-m', 'debugpy.adapter' },
  }
  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch file',
      program = function()
        local program = vim.env.NVIM_DEBUG_PROGRAM
        if program ~= nil then
          return program
        end
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      pythonPath = '/Users/gen/.rye/shims/python3',
    },
  }
end

return M
