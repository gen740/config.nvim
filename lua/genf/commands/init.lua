vim.api.nvim_create_user_command('Run', function(args)
  require('genf.asyncrun').runInConsole(args.fargs[1])
end, { nargs = 1, complete = 'file' })

vim.api.nvim_create_user_command('GitOpenPathInBrowser', function(opts)
  require('genf.commands.git_open_in_browser').git_open_in_browser(opts)
end, { range = true })

vim.api.nvim_create_user_command('LazyGit', function()
  require('genf.lazygit').lazygit_open()
end, { nargs = 0 })

vim.api.nvim_create_user_command('AlignBy', function(...)
  require('genf.commands.alignby').alignby(...)
end, { range = true, nargs = 1 })

vim.api.nvim_create_user_command('QMKAlign', function(...)
  require('genf.commands.qmk').align_keymap(...)
end, { range = true, nargs = 0 })
