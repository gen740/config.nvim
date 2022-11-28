vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4

vim.cmd('compiler cmake')

require('genf.lsp_utils').lsp_setup('cmake', true)
