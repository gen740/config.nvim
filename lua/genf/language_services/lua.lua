local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  lmap('n', '<space>f', function()
    async_format { 'stylua', vim.fn.expand('%:p') }
  end)
end

return M
