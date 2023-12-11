local M = {}

---@type number
local lazygit_server_limit = 10
---@type string?
local lazygit_pipe_name = nil

---@param tbl any[]
---@param value any
local is_value_in_table = function(tbl, value)
  for _, v in pairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

local search_lazygit_bufnr = function()
  local buf_lists = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buf_lists) do
    if vim.api.nvim_get_option_value('filetype', { buf = buf }) == 'lazygit' then
      return buf
    end
  end
  return nil
end

M.lazygit_open = function()
  if vim.api.nvim_get_option_value('filetype', { buf = 0 }) == 'lazygit' then
    return
  end

  ---@type string
  local nvim_cache_dir = vim.fn.stdpath('cache') ---@diagnostic disable-line
  local handle = vim.loop.fs_scandir(nvim_cache_dir)
  ---@type string[]
  local lazygit_pipes = {}

  while handle do
    local name, _ = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    table.insert(lazygit_pipes, name:match('lazygit%-server([0-9]*)%.pipe')) --- TODO: add ^ $
  end

  for i = 1, lazygit_server_limit do
    if not is_value_in_table(lazygit_pipes, tostring(i)) then
      lazygit_pipe_name = nvim_cache_dir .. '/lazygit-server' .. tostring(i) .. '.pipe'
      break
    end
  end
  if lazygit_pipe_name == nil then
    vim.notify('Exceed Lazygit Server limit', vim.log.levels.ERROR)
    return
  end
  local lazygit_config_yml = string.format(
    ([[
os:
  edit: |
    nvim --server %s --remote-send '<C-\><C-N>:lua require(\"genf.lazygit\").lazygit_file_open({{filename}})<CR>'
  editAtLine: |
    nvim --server %s --remote-send '<C-\><C-N>:lua require(\"genf.lazygit\").lazygit_file_open({{filename}}, {{line}})<CR>'
  editAtLineAndWait: |
    nvim --server %s --remote-send '<C-\><C-N>:lua require(\"genf.lazygit\").lazygit_file_open({{filename}}, {{line}})<CR>'
  editInTerminal: false
]]):gsub('\n', '\\n'),
    lazygit_pipe_name,
    lazygit_pipe_name,
    lazygit_pipe_name
  )

  vim.cmd('tabnew')

  local lazygit_found_nr = search_lazygit_bufnr()
  if lazygit_found_nr then
    vim.api.nvim_set_current_buf(lazygit_found_nr)
  else
    vim.cmd(
      string.format(
        'term lazygit -ucf %s,<(echo "%s")',
        os.getenv('XDG_CONFIG_HOME') .. '/lazygit/config.yml',
        lazygit_config_yml
      )
    )
    vim.fn.serverstart(lazygit_pipe_name)
  end

  vim.opt_local.winbar = '%#WinBarFileIcon#%* %#WinBarFileName#LazyGit%*'
  vim.opt_local.filetype = 'lazygit'

  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.defer_fn(function()
    vim.cmd('normal i')
  end, 0)
end

M.lazygit_server_stop = function()
  vim.fn.serverstop(lazygit_pipe_name)
end

---@param filename string
---@param line string?
M.lazygit_file_open = function(filename, line)
  vim.cmd('e ' .. filename)
  if line then
    vim.cmd(tostring(line))
  end
end

Test = function()
  vim.print(search_lazygit_bufnr())
end

return M
