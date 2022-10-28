local dir_exists = require('genf.utils').dir_exists

if dir_exists('~/.pyenv/versions/neovim-3/bin') then
  vim.g.python3_host_prog = '~/.pyenv/versions/neovim-3/bin/python3'
elseif dir_exists('~/.config/nvim-venv/bin') then
  vim.g.python3_host_prog = '~/.config/nvim-venv/bin/python3'
end

pcall(require, 'impatient')
require('genf.plugins')
require('genf.options')
require('genf.keymap')
require('genf.autocmd')
require('genf.statusline')
require('genf.foldingtxt')

vim.opt.runtimepath:append('~/home/Labo/Project/SmoothCursor.nvim')

if pcall(require, 'smoothcursor') then
  require('smoothcursor').setup {
    priority = 1,
    autostart = true,
    threshold = 1,
    speed = 18,
    type = 'exp',
    intervals = 24,
    fancy = {
      enable = true,
      head = { cursor = nil, texthl = 'SCCursor' },
      body = {
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
      },
    },
  }
end
