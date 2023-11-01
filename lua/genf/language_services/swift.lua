local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  lmap('n', '<space>f', function()
    vim.cmd('w')
    local current_line = vim.fn.line('.')
    local win_view = vim.fn.winsaveview()
    vim.cmd('silent! %!swift-format')
    -- vim.cmd('e!')
    vim.fn.winrestview(win_view)
    vim.fn.cursor(current_line, 0)
    -- require('genf.asyncrun').asyncrun(
    --   'black '
    --     .. vim.fn.expand('%:p')
    --     .. ';'
    --     .. 'isort '
    --     .. vim.fn.expand('%:p'),
    --   function()
    --     local current_line = vim.fn.line('.')
    --     local win_view = vim.fn.winsaveview()
    --     vim.cmd('e!')
    --     vim.fn.winrestview(win_view)
    --     vim.fn.cursor(current_line, 0)
    --   end,
    --   true
    -- )
  end)

  vim.keymap.set('n', '<space>rr', function()
    require('genf.asyncrun').asyncrun('swift run')
  end)
end

function M.lsp_config()
  if pcall(require, 'lspconfig') then
    local lsp_util = require('genf.language_services.utils')
    local config = require('lspconfig')['sourcekit']
    config.setup {
      capabilities = lsp_util.capabilities,
      on_attach = lsp_util.on_attach,
      filetypes = { 'swift' },
      -- cmd = { 'xcrun', '--toolchain', 'swift', 'sourcekit-lsp', '--log-level=warning' },
      cmd = { 'sourcekit-lsp' },
    }
  end
end

-- function M.dap_config()
-- end

return M
