vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun make nvim_run')
end)

vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun make nvim_build')
end)

vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
end)

vim.keymap.set('n', '<leader>f', function()
    vim.cmd [[silent !black -q %]]
end)

vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

vim.cmd('compiler python')
