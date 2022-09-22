vim.keymap.set('n', '<m-r>', function()
  require('genf.asyncrun').asyncrun('cargo run')
end)

vim.keymap.set('n', '<m-c>', function()
  require('genf.asyncrun').asyncrun('cargo build')
end)

vim.keymap.set('n', '<m-t>', function()
  vim.cmd('copen')
  vim.cmd('wincmd k')
  require('genf.asyncrun').asyncrun('cargo test')
end)

vim.keymap.set('n', '<m-s>', function()
  require('genf.asyncrun').asyncstop()
end)

vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.makeprg = 'cargo'

vim.cmd('compiler cargo')
