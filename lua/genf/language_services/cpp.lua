local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
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
      cmd = {
        '/usr/local/opt/llvm/bin/clangd',
        '-j',
        '16',
        '--enable-config',
        '--offset-encoding=utf-16',
        '-hidden-features',
      },
    }
  end
end

function M.dap_config()
  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/opt/llvm/bin/lldb-vscode', -- adjust as needed
    name = 'lldb',
  }
  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        local program = vim.env.NVIM_DEBUG_PROGRAM
        if program ~= nil then
          return program
        end
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = [[${workspaceFolder}]],
      stopOnEntry = false,
      runInTerminal = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
end

return M
