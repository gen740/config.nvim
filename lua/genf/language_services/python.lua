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

  vim.keymap.set('n', '<leader>f', function()
    local has_indent_blankline = pcall(require, 'indent_blankline')
    if vim.fn.executable('black') then
      vim.cmd([[
        silent w
        ]])
      local current_view = vim.fn.winsaveview()
      vim.cmd([[
        silent !black -q %
        silent e
        ]])
      vim.fn.winrestview(current_view)
      if has_indent_blankline then
        require('indent_blankline.commands').refresh(true, true)
      end
    end
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
        analysis = {
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = 'error',
          },
        },
      },
    },
  }
end

function M.dap_config()
  local dap = require('dap')
  dap.adapters.python = {
    type = 'executable',
    command = '/Users/fujimotogen/.pyenv/shims/python3',
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
