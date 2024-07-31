local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  lmap('n', '<space>f', function()
    async_format { 'nixfmt', vim.fn.expand('%:p') }
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('nixd')
end

return M
