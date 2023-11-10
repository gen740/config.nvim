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

vim.api.nvim_create_user_command('GitOpenPathInBrowser', function()
  local git_url = io.popen('gh repo view --json url | jq ".url"'):read()
  git_url = string.gsub(git_url, '"', '')
  local git_branch = io.popen('git rev-parse --abbrev-ref HEAD'):read()
  git_url = git_url .. '/blob/' .. git_branch

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

  local line_nr = vim.fn.line('.')
  if line_nr > 0 then
    rel_path = rel_path .. '#L' .. line_nr
  end

  os.execute('open ' .. git_url .. '/' .. rel_path)
end, {})
