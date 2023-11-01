local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('make nvim_run')
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('make nvim_build')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.cmd('compiler ghc')
end

return M
