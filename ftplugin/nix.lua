vim.keymap.set('n', '<space>f', function()
  require('genf.ftplugin-utils').async_format { 'nixfmt', vim.fn.expand('%:p') }
end, { buffer = true })
