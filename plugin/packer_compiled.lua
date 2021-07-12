-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/fujimotogen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fujimotogen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fujimotogen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fujimotogen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fujimotogen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  Async = {
    commands = { "Make" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/Async"
  },
  Closer = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/Closer"
  },
  EasyMotion = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/EasyMotion"
  },
  Jpdoc = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/Jpdoc"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["fern-git-status.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fern-git-status.vim"
  },
  ["fern-hijack.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fern-hijack.vim"
  },
  ["fern-mapping-git.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fern-mapping-git.vim"
  },
  ["fern-renderer-nerdfont.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fern-renderer-nerdfont.vim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fern.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  indentline = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/indentline"
  },
  ["nerdfont.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nerdfont.vim"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["tagbar-markdown"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/tagbar-markdown"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-latex"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-latex"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'Async'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType md ++once lua require("packer.load")({'tagbar-markdown'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'tagbar-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
