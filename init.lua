local dir_exists = require('genf.utils').dir_exists

if dir_exists('~/.pyenv/versions/neovim-3/bin') then
  vim.g.python3_host_prog = '~/.pyenv/versions/neovim-3/bin/python3'
elseif dir_exists('~/.config/nvim-venv/bin') then
  vim.g.python3_host_prog = '~/.config/nvim-venv/bin/python3'
end

require('genf.plugins')
require('genf.options')
require('genf.keymap')
require('genf.autocmd')
require('genf.statusline')
require('genf.foldingtxt')

vim.opt.runtimepath:append('~/home/Labo/Project/SmoothCursor.nvim')

require('smoothcursor').setup({
  priority = 1,
  autostart = true,
  threshold = 1,
  speed = 18,
  type = 'exp',
  intervals = 20,
  fancy = {
    enable = true,
    head = { cursor = nil, texthl = 'SCCursor' },
    body = {
      { cursor = '●', texthl = 'SCCursor' },
      { cursor = '•', texthl = 'SCCursor' },
      { cursor = '.', texthl = 'SCCursor' },
    },
  },
  -- disabled_filetypes = { 'lua' },
})

-- vim.keymap.set('n', 'n', function()
--   require('smoothcursor.utils').with_smoothcursor(pcall, vim.cmd, 'normal! n')
-- end, { noremap = true, silent = true })

vim.cmd([[
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
"
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
]])
vim.g.JpFormatCursorMovedI = 1
