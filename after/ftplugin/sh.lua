vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format({ async = true })
end)

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
