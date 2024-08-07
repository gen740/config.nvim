local M = {}

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.commentstring = '// %s'
end

function M.lsp_config()
  local lsp_util = require('genf.language_services.utils')
  local config = require('lspconfig')['clangd']

  local clangd_path = 'clangd'

  if vim.env.NEOVIM_CLANGD ~= nil then
    clangd_path = vim.env.NEOVIM_CLANGD
  else
    if vim.fn.filereadable(vim.env.HOME .. '/.llvm/bin/clangd') == 1 then
      clangd_path = vim.env.HOME .. '/.llvm/bin/clangd'
    elseif vim.fn.filereadable(vim.env.HOME .. '/.local/bin/clangd') == 1 then
      clangd_path = vim.env.HOME .. '/.local/bin/clangd'
    elseif vim.fn.filereadable('/opt/homebrew/opt/llvm/bin/clangd') == 1 then
      clangd_path = '/opt/homebrew/opt/llvm/bin/clangd'
    elseif vim.fn.filereadable('/usr/local/opt/llvm/bin/clangd') == 1 then
      clangd_path = '/usr/local/opt/llvm/bin/clangd'
    elseif vim.fn.filereadable('/usr/bin/clangd-19') == 1 then
      clangd_path = '/usr/bin/clangd-19'
    end
  end

  config.setup {
    capabilities = lsp_util.capabilities,
    cmd = {
      clangd_path,
      '-j',
      '16',
      '--enable-config',
      '--offset-encoding=utf-16',
      '-hidden-features',
    },
  }
end

function M.dap_config()
  local lldb_path = 'lldb'

  if vim.fn.filereadable(vim.env.HOME .. '/.llvm/bin/lldb-dap') == 1 then
    lldb_path = vim.env.HOME .. '/.llvm/bin/lldb-dap'
  elseif vim.fn.filereadable(vim.env.HOME .. '/.local/bin/lldb-dap') == 1 then
    lldb_path = vim.env.HOME .. '/.local/bin/lldb-dap'
  elseif vim.fn.filereadable('/opt/homebrew/opt/llvm/bin/lldb-vscode') == 1 then
    lldb_path = '/opt/homebrew/opt/llvm/bin/lldb-vscode'
  elseif vim.fn.filereadable('/usr/local/opt/llvm/bin/lldb-vscode') == 1 then
    lldb_path = '/usr/local/opt/llvm/bin/lldb-vscode'
  elseif vim.fn.filereadable('/usr/bin/lldb-dap-18') == 1 then
    lldb_path = '/usr/bin/lldb-dap-18'
  end

  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = lldb_path, -- adjust as needed
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
