vim.opt.clipboard = 'unnamed'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.list = true
vim.opt.listchars = { tab = '»─', trail = '␣', extends = '»', precedes = '«', nbsp = '%' }

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

vim.cmd('colorscheme github_dark_colorblind')
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#30363d', fg = '#0d1117' })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#30363d' })
