local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('cargo run')
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('cargo build')
  end)

  lmap('n', '<m-t>', function()
    vim.cmd('copen')
    vim.cmd('wincmd k')
    require('genf.asyncrun').asyncrun('cargo test')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.makeprg = 'cargo'

  vim.cmd('compiler cargo')
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('rust_analyzer')
end

return M
