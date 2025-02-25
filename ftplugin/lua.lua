vim.keymap.set('n', '<m-f>', function()
  require('gen740.ftplugin-utils').async_format { 'stylua', vim.fn.expand('%:p') }
end, { buffer = true })
