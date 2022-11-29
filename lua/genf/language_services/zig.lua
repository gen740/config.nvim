local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun zig build run')
  end)

  vim.keymap.set('n', '<m-t>', function()
    vim.cmd('AsyncRun zig build test')
  end)

  vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun zig build')
  end)

  vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

return M
