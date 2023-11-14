local M = {}

M.lazy_git_open = function()
  vim.cmd('tabnew')
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.cmd('term lazygit')
  vim.cmd('normal i')
  vim.keymap.set('t', '<esc>', '<esc>', { buffer = true, noremap = true, silent = true })
  vim.keymap.set('t', '<esc><space>', '<nop>', { buffer = true, noremap = true, silent = true })
  vim.keymap.set('t', '<esc>sh', '<nop>', { buffer = true, noremap = true, silent = true })
  vim.keymap.set('t', '<esc>w', '<nop>', { buffer = true, noremap = true, silent = true })
  vim.opt_local.winbar = 'LazyGit'
  vim.api.nvim_buf_set_name(0, 'LazyGit')
  vim.opt_local.ft = 'lazygit'
end

return M
