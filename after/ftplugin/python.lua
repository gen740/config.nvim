vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('make nvim_run')
end)

vim.keymap.set('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('make nvim_build')
end)

vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
end)

vim.keymap.set('n', '<leader>f', function()
    if vim.fn.executable("black") then
        vim.cmd [[
        silent w
        let current_view=winsaveview()
        silent !black -q %
        silent e
        call winrestview(current_view)
        silent redraw!
        ]]
    end
end)

local shiftwidth = 4

vim.opt_local.tabstop = shiftwidth
vim.opt_local.softtabstop = shiftwidth
vim.opt_local.shiftwidth = shiftwidth

vim.cmd('compiler python')
