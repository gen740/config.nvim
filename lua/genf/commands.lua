vim.api.nvim_create_user_command('Run', function(args)
  require('genf.asyncrun').asyncrun(args.fargs[1])
end, { nargs = 1, complete = 'file' })

vim.api.nvim_create_user_command('ReRun', function()
  require('genf.asyncrun').asyncrun(nil)
end, {})

vim.api.nvim_create_user_command('Stop', function()
  require('genf.asyncrun').asyncstop()
end, {})

vim.api.nvim_create_user_command('Rg', function(args)
  require('genf.asyncrun').ripgrep(args.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command('IN', function(args)
  require('genf.asyncrun').input(args.fargs[1])
end, { nargs = 1 })
