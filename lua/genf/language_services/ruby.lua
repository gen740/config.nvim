local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('solargraph')
end

return M
