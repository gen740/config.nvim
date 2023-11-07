local M = {}

M.lazy_plugin_path = vim.fn.stdpath('data') .. '/lazy'
M.lazy_path = M.lazy_plugin_path .. '/lazy.nvim'

M.init = function()
  if not vim.loop.fs_stat(M.lazy_path) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      M.lazy_path,
    }
  end
  vim.opt.rtp:prepend(M.lazy_path)
  require('lazy').setup('plugins', {
    change_detection = {
      enabled = false,
      notify = false,
    },
  })
end

return M
