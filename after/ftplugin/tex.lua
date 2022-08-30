-- set conceallevel=0
-- let g:tex_conceal='admgs'
-- let g:tex_fast= "MS"
-- " set conceallevel=0
-- " let g:tex_conceal=''
-- set concealcursor="invc"
-- hi Conceal guifg=#719cd6

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
