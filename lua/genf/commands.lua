vim.api.nvim_create_user_command('Run', function(args)
  require('genf.asyncrun').runInConsole(args.fargs[1])
end, { nargs = 1, complete = 'file' })

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

vim.api.nvim_create_user_command('RaycastAICommit', function()
  -- copy the git diff to clipboard
  local diff = vim.system({ 'git', 'diff', 'HEAD' }):wait().stdout
  vim.fn.setreg('+', diff)
  vim
    .system({
      'osascript',
      '-e',
      [[tell application "System Events"
    key down {command}
    key code 49
    key up {command}
    delay 0.3
    keystroke "AI Commit"
    delay 0.3
    key code 36
end tell]],
    })
    :wait()
end, { nargs = 0 })
