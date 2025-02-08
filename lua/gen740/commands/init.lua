vim.api.nvim_create_user_command('GitOpenPathInBrowser', function(opts)
  require('gen740.commands.git_open_in_browser').git_open_in_browser(opts)
end, { range = true })

vim.api.nvim_create_user_command('LazyGit', function()
  require('gen740.lazygit').lazygit_open()
end, { nargs = 0 })

vim.api.nvim_create_user_command('AlignBy', function(...)
  require('gen740.commands.alignby').alignby(...)
end, { range = true, nargs = 1 })

vim.api.nvim_create_user_command('QMKAlign', function(...)
  require('gen740.commands.qmk').align_keymap(...)
end, { range = true, nargs = 0 })
