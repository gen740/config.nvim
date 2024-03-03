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
  local git_url = vim.system({ 'git', 'remote', 'get-url', 'origin' }):wait().stdout:gsub('\n', '')
  if git_url == '' or git_url == nil then
    vim.notify('Not in git repo')
    return
  end
  if git_url:find('github') then
    git_url = git_url:gsub('git@', 'https://'):gsub('github.com:', 'github.com/'):gsub('.git$', '')
  end

  git_url = git_url
    .. '/blob/'
    .. vim
      .system({
        'git',
        'rev-parse',
        'origin/' .. vim.system({ 'git', 'branch', '--show-current' }):wait().stdout:gsub('\n', ''),
      })
      :wait().stdout
      :gsub('\n', '')

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

  local rel_path = get_relative_path(
    vim.fn.expand('%:p'),
    vim.system({ 'git', 'rev-parse', '--show-toplevel' }):wait().stdout:gsub('\n', '')
  )
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
