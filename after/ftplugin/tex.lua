-- set conceallevel=0
-- let g:tex_conceal='admgs'
-- let g:tex_fast= "MS"
-- " set conceallevel=0
-- " let g:tex_conceal=''
-- set concealcursor="invc"
-- hi Conceal guifg=#719cd6

vim.keymap.set('n', '<m-r>', function()
  vim.fn.system('open -a /Applications/LivePDFviewer.app document.pdf')
  -- vim.cmd('Run luatex document.tex')
end)

vim.keymap.set('n', '<m-c>', function()
  vim.cmd('Run lualatex document.tex')
end)

vim.keymap.set('n', '<m-s>', function()
  vim.cmd('Stop')
end)

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

vim.cmd.iab([[@a \alpha]])
vim.cmd.iab([[@b \bete]])
vim.cmd.iab([[@c \chi]])
vim.cmd.iab([[@d \delta]])
vim.cmd.iab([[@e \epsilon]])
vim.cmd.iab([[@u \mu]])
vim.cmd.iab([[@n \nu]])
