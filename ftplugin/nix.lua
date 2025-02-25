vim.keymap.set('n', '<m-f>', function()
  require('gen740.ftplugin-utils').async_format { 'nixfmt', vim.fn.expand('%:p') }
end, { buffer = true })
