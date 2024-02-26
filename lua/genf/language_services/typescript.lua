local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)
  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<m-t>', function()
    require('genf.asyncrun').asyncrun('npm run test')
  end)

  local shiftwidth = 2

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('vtsls')
end

return M
