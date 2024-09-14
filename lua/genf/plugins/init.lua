local pdir_name = 'genf/plugins'
local base_path = vim.fn.stdpath('config') .. '/lua/' .. pdir_name

local handle = vim.loop.fs_scandir(base_path)

while handle do
  local name, _ = vim.loop.fs_scandir_next(handle)

  if not name then
    break
  end
  if name:match('%.lua$') and name ~= 'init.lua' then
    require(pdir_name .. '.' .. name:gsub('%.lua$', ''))
  end
end
