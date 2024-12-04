vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true

vim.keymap.set('n', '<space>f', function()
  require('genf.ftplugin-utils').async_format { 'stylua', vim.fn.expand('%:p') }
end, { buffer = true })
