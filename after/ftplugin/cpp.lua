vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('make nvim_run')
end)

vim.keymap.set('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('make nvim_build')
end)

vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
end)

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
