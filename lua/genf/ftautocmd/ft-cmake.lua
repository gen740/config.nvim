local M = {}

-- local lmap = require('genf.language_services.utils').set_local_map
-- local async_format = require('genf.language_services.utils').async_format

function M.setup()
  -- vim.opt_local.tabstop = 2
  -- vim.opt_local.softtabstop = 2
  -- vim.opt_local.shiftwidth = 2
  --
  -- lmap('n', '<space>f', function()
  --   async_format({ 'cmake-format', '-i', vim.fn.expand('%:p') }, true)
  -- end)
  --
  -- vim.cmd('compiler cmake')
end

return M
