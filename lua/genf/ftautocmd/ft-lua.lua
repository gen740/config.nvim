local M = {}

function M.setup()
  vim.keymap.set('n', '<space>f', function()
    require('genf.ftautocmd.utils').async_format { 'stylua', vim.fn.expand('%:p') }
  end, { buffer = true })
end

return M
