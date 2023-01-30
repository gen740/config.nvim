local dir_exists = require('genf.utils').dir_exists

if dir_exists('~/.pyenv/versions/neovim-3/bin') then
  vim.g.python3_host_prog = '~/.pyenv/versions/neovim-3/bin/python3'
elseif dir_exists('~/.config/nvim-venv/bin') then
  vim.g.python3_host_prog = '~/.config/nvim-venv/bin/python3'
end

require('genf.autocmd')
require('genf.options')
require('genf.plugins')
require('genf.keymap')
require('genf.commands')
require('genf.statusline')
require('genf.foldingtxt')

vim.opt.runtimepath:append('~/home/Labo/Project/SmoothCursor.nvim')

if pcall(require, 'smoothcursor') then
  require('smoothcursor').setup {
    disable_float_win = true,
    priority = 100,
    autostart = true,
    threshold = 1,
    speed = 18,
    type = 'exp',
    intervals = 22,
    fancy = {
      enable = true,
      head = { cursor = '', texthl = 'SCCursorHead' },
      body = {
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
      },
    },
    -- flyin_effect = 'bottom',
  }
end
