local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncbuild('task execute')
  end)

  lmap('n', '<m-c>', function()
    require('genf.asyncrun').asyncbuild('task compile')
  end)

  lmap('n', '<m-g>', function()
    require('genf.asyncrun').asyncbuild('task cmake')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<m-e>', function()
    require('genf.asyncrun').asyncbuild([[task ]] .. vim.fn.expand('%:t:r'))
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('ghdl_ls')
end

return M
