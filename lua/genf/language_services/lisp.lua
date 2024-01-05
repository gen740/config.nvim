local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

return M
