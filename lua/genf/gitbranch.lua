local M = {}

-- vars
local current_git_branch = ''
local current_git_dir = ''
local active_bufnr = '0'

-- os specific path separator
local sep = package.config:sub(1, 1)
local file_changed = sep ~= '\\' and vim.loop.new_fs_event() or vim.loop.new_fs_poll()

local function get_git_head(head_file)
  local f_head = io.open(head_file)
  if f_head then
    local HEAD = f_head:read()
    f_head:close()
    local branch = HEAD:match('ref: refs/heads/(.+)$')
    if branch then
      current_git_branch = branch
    else
      current_git_branch = HEAD:sub(1, 6)
    end
  end
  return nil
end

---updates the current value of git_branch and sets up file watch on HEAD file
local function update_branch()
  active_bufnr = tostring(vim.api.nvim_get_current_buf())
  file_changed:stop()
  local git_dir = current_git_dir
  if git_dir and #git_dir > 0 then
    local head_file = git_dir .. sep .. 'HEAD'
    get_git_head(head_file)
    file_changed:start(
      head_file,
      sep ~= '\\' and {} or 1000,
      vim.schedule_wrap(function()
        -- reset file-watch
        update_branch()
      end)
    )
  else
    -- set to '' when git dir was not found
    current_git_branch = ''
  end
end

function M.find_git_dir(dir_path)
  local file_dir = dir_path or vim.fn.expand('%:p:h')
  local root_dir = file_dir
  local git_dir
  -- Search upward for .git file or folder
  while root_dir do
    local git_path = root_dir .. sep .. '.git'
    local git_file_stat = vim.loop.fs_stat(git_path)
    if git_file_stat then
      if git_file_stat.type == 'directory' then
        git_dir = git_path
      elseif git_file_stat.type == 'file' then
        -- separate git-dir or submodule is used
        local file = io.open(git_path)
        if file then
          git_dir = file:read()
          git_dir = git_dir and git_dir:match('gitdir: (.+)$')
          file:close()
        end
        -- submodule / relative file path
        if git_dir and git_dir:sub(1, 1) ~= sep and not git_dir:match('^%a:.*$') then
          git_dir = git_path:match('(.*).git') .. git_dir
        end
      end
      if git_dir then
        local head_file_stat = vim.loop.fs_stat(git_dir .. sep .. 'HEAD')
        if head_file_stat and head_file_stat.type == 'file' then
          break
        else
          git_dir = nil
        end
      end
    end
    root_dir = root_dir:match('(.*)' .. sep .. '.-')
  end

  if dir_path == nil and current_git_dir ~= git_dir then
    current_git_dir = git_dir
    update_branch()
  end
  return git_dir
end

function M.get_branch()
  if vim.g.actual_curbuf ~= nil and active_bufnr ~= vim.g.actual_curbuf then
    M.find_git_dir()
  end
  return current_git_branch
end

return M
