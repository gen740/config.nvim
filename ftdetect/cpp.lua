vim.cmd([[
au BufRead,BufNewFile *.cppm set filetype=cpp
]])

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('DetectCpp', { clear = true })

autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.cppm' },
  group = 'CustomAutocommand',
  callback = function()
    vim.opt_local.filetype = 'cpp'
  end,
})
