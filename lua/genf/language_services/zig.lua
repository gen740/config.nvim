local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    vim.cmd('AsyncRun zig build run')
  end)

  lmap('n', '<m-t>', function()
    vim.cmd('AsyncRun zig build test')
  end)

  lmap('n', '<m-c>', function()
    vim.cmd('AsyncRun zig build')
  end)

  lmap('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

return M
