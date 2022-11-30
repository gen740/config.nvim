local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun go run .')
  end)

  vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun go build .')
  end)

  vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.opt_local.expandtab = false
  vim.opt_local.list = false
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('gopls')
end

return M
