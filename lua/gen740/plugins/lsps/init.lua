vim.lsp.set_log_level('DEBUG')

local lsp_log_file = vim.fn.stdpath('state') .. '/lsp.log'
local lsp_log_size = vim.fn.getfsize(lsp_log_file)

if lsp_log_size > 100 * 1000 * 1000 then
  print('LSP log file is too big, renaming to lsp.log.old')
  vim.fn.rename(lsp_log_file, lsp_log_file .. '.old')
end

local pdir_name = 'gen740/plugins/lsps'
local base_path = vim.fn.stdpath('config') .. '/lua/' .. pdir_name

local handle = vim.loop.fs_scandir(base_path)

while handle do
  local name, _ = vim.loop.fs_scandir_next(handle)
  if not name then
    break
  end
  if name:match('%.lua$') and name ~= 'init.lua' and name ~= 'utils.lua' then
    require(pdir_name .. '.' .. name:gsub('%.lua$', ''))
  end
end
