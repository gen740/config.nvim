local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  lmap('n', '<m-s>', function()
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
