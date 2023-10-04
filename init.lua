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
