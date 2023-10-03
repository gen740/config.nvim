local dir_exists = function(path)
  if type(path) ~= 'string' then
    error('input error')
    return false
  end
  local response = os.execute('cd ' .. path .. ' 2> /dev/null')
  if response == 0 or response == true then
    return true
  end
  return false
end

if dir_exists('~/.pyenv/versions/neovim-3/bin') then
  vim.g.python3_host_prog = '~/.pyenv/versions/neovim-3/bin/python3'
elseif dir_exists('~/.config/nvim-venv/bin') then
  vim.g.python3_host_prog = '~/.config/nvim-venv/bin/python3'
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
  require('genf.neovide')
end

require('genf.autocmd')
require('genf.options')

require('lazy').setup('plugins', {
  change_detection = {
    enabled = false,
    notify = false,
  },
})

require('genf.keymap')
require('genf.commands')
require('genf.statusline')
require('genf.winbar')
require('genf.foldingtxt')
