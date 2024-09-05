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

vim.api.nvim_create_user_command('AlignBy', function(opts)
  local delimiter = opts.fargs[1]

  local start_line = opts.line1
  local end_line = opts.line2

  local text = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local min_indent = 100

  for _, line in ipairs(text) do
    local indent = line:find('%S')
    if indent ~= nil then
      indent = indent - 1
      if indent then
        min_indent = math.min(min_indent, indent)
      end
    end
  end

  local split_text = vim.tbl_map(function(line)
    return vim.tbl_map(function(word)
      return word:gsub('^%s*(.-)%s*$', '%1')
    end, vim.split(line, delimiter))
  end, text)

  local counter = 1
  local spaces = {}
  while true do
    local max_length = nil
    for _, line in ipairs(split_text) do
      if line[counter] then
        max_length = math.max(max_length or 0, #line[counter])
      end
    end

    if max_length == nil then
      break
    end
    spaces[counter] = max_length
    counter = counter + 1
  end

  for i, line in ipairs(split_text) do
    local new_line = ''
    for j, word in ipairs(line) do
      new_line = new_line .. word .. string.rep(' ', spaces[j] - #word)
      if j ~= #line then
        new_line = new_line .. delimiter .. ' '
      end
    end
    split_text[i] = new_line
  end
  split_text = vim.tbl_map(function(line)
    return (string.rep(' ', min_indent) .. line):gsub('(.-)%s*$', '%1')
  end, split_text)
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, split_text)
end, { range = true, nargs = 1 })
