local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun make nvim_run')
  end)

  vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun make nvim_build')
  end)

  vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

return M
