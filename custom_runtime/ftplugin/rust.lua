vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun cargo run')
end)

vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun cargo build')
end)

vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
end)

vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.makeprg = 'cargo'
vim.cmd('compiler cargo')
