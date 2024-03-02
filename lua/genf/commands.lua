vim.api.nvim_create_user_command('Run', function(args)
  require('genf.asyncrun').asyncrun(args.fargs[1])
end, { nargs = 1, complete = 'file' })

vim.api.nvim_create_user_command('Stop', function()
  require('genf.asyncrun').asyncstop()
end, {})

vim.api.nvim_create_user_command('Rg', function(args)
  require('genf.asyncrun').ripgrep(args.fargs)
end, { nargs = '+' })

vim.api.nvim_create_user_command('In', function(args)
  require('genf.asyncrun').input(args.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command('GitOpenPathInBrowser', function(opts)
  local git_url = io.popen('gh repo view --json url | jq ".url"'):read()
  git_url = string.gsub(git_url, '"', '')
  git_url = git_url .. '/blob/' .. io.popen('git rev-parse origin/$(git branch --show-current)'):read()

  local function get_relative_path(absolute_path, base_path)
    if base_path:sub(-1) ~= '/' then
      base_path = base_path .. '/'
    end

    local base_end = absolute_path:find(base_path, 1, true)
    if base_end then
      return absolute_path:sub(#base_path + base_end)
    else
      return nil
    end
  end

  local rel_path = get_relative_path(vim.fn.expand('%:p'), io.popen('git rev-parse --show-toplevel'):read())
  if rel_path == nil then
    vim.notify('Not in git repo')
    return
  end

  if opts.line1 == opts.line2 then
    rel_path = rel_path .. '#L' .. opts.line1
  else
    rel_path = rel_path .. '#L' .. opts.line1 .. '-L' .. opts.line2
  end
  os.execute('open ' .. git_url .. '/' .. rel_path)
end, { range = true })

vim.api.nvim_create_user_command('LazyGit', function()
  require('genf.lazygit').lazygit_open()
end, { nargs = 0 })
