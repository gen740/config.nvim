vim.api.nvim_create_user_command('Run', function(args)
  require('genf.asyncrun').asyncrun(args.fargs[1])
end, { nargs = 1, complete = 'file' })

vim.api.nvim_create_user_command('Stop', function()
  require('genf.asyncrun').asyncstop()
end, {})

vim.api.nvim_create_user_command('Rg', function(args)
  local query = ''
  local dir_set = false
  local dir = '.'
  for _, v in ipairs(args.fargs) do
    if dir_set then
      dir_set = false
      dir = v
    elseif v == '--dir' then
      dir_set = true
    else
      query = query .. ' ' .. v
    end
  end
  require('genf.asyncrun').ripgrep(query, dir)
end, { nargs = '+' })

vim.api.nvim_create_user_command('In', function(args)
  require('genf.asyncrun').input(args.fargs[1])
end, { nargs = 1 })
