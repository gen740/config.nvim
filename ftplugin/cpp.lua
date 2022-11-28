vim.keymap.set('n', '<m-r>', function()
  require('genf.asyncrun').asyncrun('task execute')
end)

vim.keymap.set('n', '<m-c>', function()
  require('genf.asyncrun').asyncrun('task compile')
end)

vim.keymap.set('n', '<m-s>', function()
  require('genf.asyncrun').asyncstop()
end)

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

require('genf.lsp_utils').lsp_setup('clangd', true)
