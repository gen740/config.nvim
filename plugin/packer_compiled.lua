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
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  indentline = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/indentline"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  previm = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/previm"
  },
  tabular = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/tabular"
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
  ultisnips = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/ultisnips"
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
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
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
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  ["vimdoc-ja"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vimdoc-ja"
  },
  vimspector = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimspector"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: gruvbox
time([[Setup for gruvbox]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17colo gruvbox\bcmd\bvim\0", "setup", "gruvbox")
time([[Setup for gruvbox]], false)
time([[packadd for gruvbox]], true)
vim.cmd [[packadd gruvbox]]
time([[packadd for gruvbox]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType md ++once lua require("packer.load")({'vimtex', 'emmet-vim', 'previm', 'tagbar-markdown', 'goyo.vim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsv ++once lua require("packer.load")({'csv.vim'}, { ft = "tsv" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex', 'vim-latex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType txt ++once lua require("packer.load")({'goyo.vim'}, { ft = "txt" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vimtex', 'vim-latex', 'emmet-vim', 'previm', 'tagbar-markdown', 'goyo.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
