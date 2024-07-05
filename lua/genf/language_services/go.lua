local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    vim.cmd('AsyncRun go run .')
  end)

  lmap('n', '<m-c>', function()
    vim.cmd('AsyncRun go build .')
  end)

  lmap('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  vim.opt_local.expandtab = false
  vim.opt_local.list = false
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('gopls')
end

return M
