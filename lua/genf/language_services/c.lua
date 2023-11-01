local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    vim.cmd('AsyncRun make nvim_run')
  end)

  lmap('n', '<m-c>', function()
    vim.cmd('AsyncRun make nvim_build')
  end)

  lmap('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

return M
