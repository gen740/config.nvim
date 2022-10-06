vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

vim.opt_local.formatexpr = 'jpfmt#formatexpr()'
vim.opt_local.listchars = [[tab:┈┈,trail:~]]
vim.opt_local.colorcolumn = '0'

vim.keymap.set('n', '<space>f', function()
  vim.lsp.buf.format({ async = true })
end)
