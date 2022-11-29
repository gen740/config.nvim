local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('make nvim_run')
  end)

  vim.keymap.set('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('make nvim_build')
  end)

  vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.cmd('compiler ghc')
end

return M
