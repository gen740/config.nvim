-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
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
    commands = { "AsyncRun" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/asyncrun.vim"
  },
  ["auto-pairs"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/auto-pairs"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-ultisnips"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips/after/plugin/cmp_nvim_ultisnips.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-treesitter"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/cmp-treesitter"
  },
  ["compe-tmux"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/compe-tmux/after/plugin/compe_tmux.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/compe-tmux"
  },
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nΩ\t\0\0\4\0\"\00016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2=\2\21\0015\2\23\0005\3\22\0=\3\a\2=\2\24\0015\2\26\0005\3\25\0=\3\a\2=\2\27\1=\1\4\0006\0\0\0009\0\1\0005\1\29\0=\1\28\0006\0\0\0009\0\1\0005\1\31\0=\1\30\0006\0\0\0009\0 \0'\2!\0B\0\2\1K\0\1\0Gautocmd FileType dashboard highlight DashboardHeader guifg=#9999bb\bcmd\1\2\0\0\5\28dashboard_custom_footer\1\2\0\0\5\28dashboard_custom_header\15book_marks\1\0\1\fcommand\23:DashboardJumpMark\1\2\0\0CÔë° Jump to bookmarks                                         \14find_word\1\0\1\fcommand\23:DashboardFindWord\1\2\0\0CÔáÇ Find word                                                 \23change_colorscheme\1\0\1\fcommand :DashboardChangeColorscheme\1\2\0\0CÓà´ Change colorscheme                                        \rnew_file\1\0\1\fcommand\22:DashboardNewFile\1\2\0\0CÔÖõ New file                                                  \14find_file\1\0\1\fcommand\23:DashboardFindFile\1\2\0\0CÔÖú Find file                                                 \17find_history\1\0\1\fcommand\26:DashboardFindHistory\1\2\0\0CÔú° Recently opened files                                     \16buffer_list\1\0\0\16description\1\0\1\fcommand.:cd ~/.config/nvim | Telescope find_files\1\2\0\0CÓòï Config Files                                              \29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÌ\v\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\2\17follow_files\2\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\fnoremap\2\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<cr>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<cr>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\to ih::<c-u>lua require\"gitsigns.actions\".select_hunk()<cr>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\vbuffer\2\nsigns\1\0\5\18sign_priority\3\6\20update_debounce\3d\vlinehl\1\14word_diff\1\nnumhl\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17colo gruvbox\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n™\5\0\0\4\0\15\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0005\1\6\0=\1\5\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\24char_highlight_list\1\v\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\20buftype_exclude\1\0\2\25space_char_blankline\6 \tchar\b‚îÇ\1\3\0\0\14dashboard\rmarkdown\nsetup\21indent_blankline\frequire\1\3\0\0\14dashboard\rmarkdown\31indentLine_fileTypeExclude\6gVautocmd FileType * highlight IndentBlanklineIndent2 guifg=#333333 blend=nocombineVautocmd FileType * highlight IndentBlanklineIndent1 guifg=#666666 blend=nocombine\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-status.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vpreset\fdefault\14with_text\2\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nü\4\0\0\t\0\27\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\3\0004\5\3\0006\6\0\0'\b\15\0B\6\2\0029\6\16\6>\6\1\5>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\14nvim-tree\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rfiletype\rencoding\14lualine_c\vstatus\15lsp-status\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇµ\bÓÇ∑\23section_separators\1\3\0\0\bÓÇ¥\bÓÇ∂\1\0\a\18right_padding\3\1\17left_padding\3\1\fpadding\3\1\18icons_enabled\3\1\ntheme\fonedark\nupper\1\nlower\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neomake = {
    commands = { "Neomake", "Neomake!" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/neomake"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameV\0\2\6\0\5\0\14\18\4\1\0009\2\0\1'\5\1\0B\2\3\2\15\0\2\0X\3\2Ä'\2\2\0X\3\1Ä'\2\3\0'\3\4\0\18\4\2\0\18\5\0\0&\3\5\3L\3\2\0\5\tÔÅ± \tÔÅú \nerror\nmatchå\a\1\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\15highlights\14separator\1\0\1\nguifg\f#333333\22separator_visible\1\0\1\nguifg\f#333333\23separator_selected\1\0\1\nguifg\f#333333\20buffer_selected\1\0\1\nguifg\vorange\tfill\1\0\0\1\0\1\nguibg\f#333333\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\rfiletype\rNvimTree\ttext\22Ôê¢ File Explorer\26diagnostics_indicator\0\19name_formatter\0\1\0\23\28show_buffer_close_icons\2\15close_icon\bÔÄç\24show_tab_indicators\1\18modified_icon\b‚óè\24persist_buffer_sort\1\22buffer_close_icon\bÔôï\27always_show_bufferline\1\19indicator_icon\b‚ñé\25enforce_regular_tabs\1\20separator_style\nslant\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\20show_close_icon\2\18close_command\16bdelete! %d\22show_buffer_icons\2\fnumbers\tnone\16diagnostics\rnvim_lsp\fsort_by\aid\rtab_size\3\6\22max_prefix_length\3\n\20max_name_length\3\15\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim \1\0\2\5\0\n\0\0176\2\1\0'\4\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\4\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\rnvim_lua\n[Lua]\18latex_symbols\f[Latex]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkindÔ\6\1\0\v\0000\3[6\0\0\0'\2\1\0B\0\2\2)\1(\0009\2\2\0005\4\4\0005\5\3\0=\5\5\0045\5\a\0003\6\6\0=\6\b\5=\5\t\0045\5\f\0009\6\n\0009\6\v\6B\6\1\2=\6\r\0059\6\n\0009\6\14\6B\6\1\2=\6\15\0059\6\n\0009\6\16\6)\b¸ˇB\6\2\2=\6\17\0059\6\n\0009\6\16\6)\b\4\0B\6\2\2=\6\18\0059\6\n\0009\6\19\6B\6\1\2=\6\20\0059\6\n\0009\6\21\6B\6\1\2=\6\22\0059\6\n\0009\6\23\0064\b\0\0B\6\2\2=\6\24\5=\5\n\0045\5\26\0005\6\25\0=\6\27\0056\6\28\0009\6\29\6\24\b\0\0016\t\30\0009\t\31\t9\t \t\24\n\0\1\24\n\1\n\25\n\2\n#\t\n\t\"\b\t\bB\6\2\2=\6!\0056\6\28\0009\6\29\0066\b\30\0009\b\31\b9\b\"\b#\b\b\1\"\b\b\1B\6\2\2=\6#\5=\5$\0044\5\a\0005\6%\0>\6\1\0055\6&\0>\6\2\0055\6'\0>\6\3\0055\6(\0>\6\4\0055\6)\0>\6\5\0055\6*\0>\6\6\5=\5+\0045\5-\0003\6,\0=\6.\5=\5/\4B\2\2\1K\0\1\0\15formatting\vformat\1\0\0\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\14ultisnips\1\0\1\tname\15treesitter\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\18documentation\14maxheight\nlines\rmaxwidth\fcolumns\6o\bvim\nfloor\tmath\vborder\1\0\1\17winhighlightDNormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\15completion\1\0\0\1\0\1\17autocomplete\2\nsetup\bcmp\frequire\4 \18\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim‡\1\0\0\5\0\a\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\4\0&\1\2\1L\1\2\0X\1\16Ä6\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\5\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\5\0&\1\2\1L\1\2\0X\1\2Ä'\1\6\0L\1\2\0K\0\1\0\20/usr/bin/python\22/.venv/bin/python\21/venv/bin/python\15executable\vgetcwd\afn\bvim\2∑\4\1\0\5\0\19\0$6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0019\1\2\0005\2\6\0005\3\a\0=\3\b\2=\2\5\0019\1\t\0004\2\3\0005\3\v\0003\4\f\0=\4\r\0034\4\0\0=\4\b\3>\3\1\2=\2\n\0019\1\t\0009\2\t\0009\2\n\2=\2\14\0019\1\t\0009\2\t\0009\2\n\2=\2\15\0019\1\t\0004\2\3\0005\3\16\0003\4\17\0=\4\18\3>\3\1\2=\2\5\1K\0\1\0\15pythonPath\0\1\0\4\fprogram\f${file}\frequest\vlaunch\tname\16Launch file\ttype\vpython\trust\6c\fprogram\0\1\0\6\16stopOnEntry\1\frequest\vlaunch\bcwd\23${workspaceFolder}\tname\vLaunch\18runInTerminal\1\ttype\tlldb\bcpp\19configurations\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\fcommand:/Users/fujimotogen/.pyenv/versions/debugpy/bin/python\ttype\15executable\vpython\1\0\3\tname\tlldb\fcommand(/usr/local/opt/llvm/bin/lldb-vscode\ttype\15executable\tlldb\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nó\4\0\0\6\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0004\4\4\0005\5\v\0>\5\1\0045\5\f\0>\5\2\0045\5\r\0>\5\3\4=\4\14\3=\3\15\0025\3\16\0005\4\17\0=\4\14\3=\3\18\0025\3\19\0005\4\21\0005\5\20\0=\5\22\4=\4\t\3=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\0\ttray\1\2\0\0\trepl\1\0\3\tsize\3\15\18open_on_start\2\rposition\vbottom\fsidebar\relements\1\0\2\aid\vstacks\tsize\4üäÆè\5∏Ω‘˛\3\1\0\2\aid\16breakpoints\tsize\4üäÆè\5∏Ω‘˛\3\1\0\2\aid\vscopes\tsize\4üäÆè\5∏Ω‘˛\3\1\0\3\tsize\3(\18open_on_start\2\rposition\nright\rmappings\vexpand\1\0\4\topen\6o\tedit\6e\vremove\6d\trepl\6r\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\b‚ñ∏\rexpanded\b‚ñæ\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0¿\24nvim_buf_set_option\bapi\bvimê\14\1\1\r\0<\0û\0015\1\0\0005\2\1\0006\3\2\0\18\5\2\0B\3\2\4H\6\vÄ'\b\3\0\18\t\6\0&\b\t\b6\t\4\0009\t\5\t9\t\6\t\18\v\b\0005\f\a\0=\a\b\f=\b\t\fB\t\3\1F\6\3\3R\6Û6\3\4\0009\3\n\0039\3\v\0036\4\4\0009\4\n\0049\4\r\0046\6\4\0009\6\n\0069\6\v\0069\6\14\0065\a\15\0=\1\16\aB\4\3\2=\4\f\0036\3\4\0009\3\n\0039\3\v\0036\4\4\0009\4\n\0049\4\r\0046\6\4\0009\6\n\0069\6\v\0069\6\18\0065\a\19\0=\1\16\aB\4\3\2=\4\17\0033\3\20\0003\4\21\0\18\5\4\0'\a\22\0'\b\23\0B\5\3\0015\5\24\0\18\6\3\0'\b\25\0'\t\26\0'\n\27\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\28\0'\n\29\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\30\0'\n\31\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t \0'\n!\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\"\0'\n#\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t$\0'\n%\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t&\0'\n'\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t(\0'\n)\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t*\0'\n+\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t,\0'\n-\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t.\0'\n/\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t0\0'\n1\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t2\0'\n3\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t4\0'\n5\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t6\0'\n7\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t8\0'\n9\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t:\0'\n;\0\18\v\5\0B\6\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<space>tdJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\1\0\0\19signature_help\31textDocument/signatureHelp\vborder\1\0\0\nhover\twith\23textDocument/hover\rhandlers\blsp\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\bvim\23LspDiagnosticsSign\npairs\1\0\4\tHint\tÔ†µ \fWarning\tÔî© \16Information\tÔëâ \nError\tÔôô \1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ≥\a\1\0\17\0/\0U6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3'\4\6\0B\1\3\0026\2\a\0009\2\b\2\18\4\1\0'\5\t\0B\2\3\0016\2\a\0009\2\b\2\18\4\1\0'\5\n\0B\2\3\0013\2\v\0005\3\f\0005\4\r\0006\5\14\0\18\a\4\0B\5\2\4X\b\6Ä8\n\t\0009\n\15\n5\f\16\0=\2\17\f=\3\18\fB\n\2\1E\b\3\3R\b¯6\5\0\0'\a\1\0B\5\2\0029\5\19\0059\5\15\0055\a\21\0005\b\20\0=\b\22\a=\2\17\aB\5\2\1'\5\23\0\18\6\5\0'\a\24\0&\6\a\0066\a\0\0'\t\1\0B\a\2\0029\a\25\a9\a\15\a5\t\28\0005\n\26\0>\6\1\n\18\v\5\0'\f\27\0&\v\f\v>\v\3\n=\n\22\t=\2\17\t5\n,\0005\v\30\0005\f\29\0=\f\31\v5\f!\0005\r \0=\r\"\f=\f#\v5\f'\0006\r\2\0009\r$\r9\r%\r'\15&\0+\16\2\0B\r\3\2=\r(\f=\f)\v5\f*\0=\f+\v=\v-\n=\n.\tB\a\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\2\tpath\23/usr/local/bin/lua\fversion\vLuaJIT\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua#/bin/macOS/lua-language-server8/Users/fujimotogen/.local/tools/lua-language-server\bcmd\1\0\0\1\2\0\0002/Users/fujimotogen/.local/bin/zeta-note-macos\14zeta_note\nflags\14on_attach\1\0\0\nsetup\vipairs\1\15\0\0\nvimls\fpyright\rdockerls\rtsserver\thtml\ncssls\18rust_analyzer\vclangd\ntaplo\vjsonls\vtexlab\ngopls\vbashls\ncmake\1\0\1\26debounce_text_changes\3d\0\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-markdown-preview"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/nvim-markdown-preview"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionÁÃô≥\6≥ÊÃ˛\3Ñ\3\1\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\rwinblend\3\3\vborder\vsingle\nshell\6o\bvim\20shade_filetypes\tsize\1\0\t\20insert_mappings\2\20start_in_insert\2\19shading_factor\r<number>\20shade_terminals\2\17hide_numbers\2\17open_mapping\n<m-w>\14direction\15horizontal\18close_on_exit\2\17persist_size\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÈ\n\0\0\3\0)\0g6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\0\0=\1\f\0006\0\0\0009\0\1\0)\1\0\0=\1\r\0006\0\0\0009\0\1\0)\1\0\0=\1\14\0006\0\0\0009\0\1\0)\1\1\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\17\0006\0\0\0009\0\1\0)\1\0\0=\1\18\0006\0\0\0009\0\1\0)\1\1\0=\1\19\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\1\0=\1\22\0006\0\0\0009\0\1\0005\1\25\0005\2\24\0=\2\26\0015\2\27\0=\2\28\1=\1\23\0006\0\0\0009\0\1\0005\1\30\0=\1\29\0006\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0005\2#\0=\2$\0015\2%\0=\2&\0015\2'\0=\2(\1=\1!\0K\0\1\0\blsp\1\0\4\thint\bÔÅ™\fwarning\bÔÅ±\nerror\bÔÅó\tinfo\bÔÅö\vfolder\1\0\b\topen\bÓóæ\17symlink_open\bÓóæ\17arrow_closed\bÔë†\15empty_open\bÔÑï\fdefault\bÓóø\fsymlink\bÔíÇ\nempty\bÔÑî\15arrow_open\bÔëº\bgit\1\0\a\runmerged\bÓúß\14untracked\b‚òÖ\vstaged\b‚úì\fdeleted\bÔëò\runstaged\b‚úó\fignored\b‚óå\frenamed\b‚ûú\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\1\0\4\18folder_arrows\3\1\nfiles\3\1\ffolders\3\1\bgit\3\1\25nvim_tree_show_icons\1\0\3\rMAKEFILE\3\1\rMakefile\3\1\14README.md\3\1\28nvim_tree_special_files\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\3\0\0\vpacker\aqf$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\24nvim_tree_auto_open\26nvim_tree_auto_resize\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nì\a\0\0\6\0)\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\n\0005\5\v\0=\5\f\4=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\21\0005\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\0025\3!\0005\4 \0=\4\"\0035\4#\0=\4$\0035\4%\0005\5&\0=\5\f\4=\4'\3=\3(\2B\0\2\1K\0\1\0\rrefactor\17smart_rename\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\15<leader>sP\21@parameter.inner\14swap_next\1\0\1\15<leader>sp\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aaf\20@function.outer\aif\20@function.inner\1\0\1\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
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
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14:loadview\bcmd\bvim≥\6\1\0\n\0\30\0*6\0\0\0'\2\1\0B\0\2\0025\1\3\0003\2\2\0=\2\4\0016\2\0\0'\4\5\0B\2\2\0029\2\6\0025\4\28\0005\5\17\0005\6\r\0005\a\t\0009\b\a\0009\t\b\0 \b\t\b \b\1\b=\b\n\a9\b\v\0=\b\f\a=\a\14\0065\a\15\0009\b\v\0=\b\f\a9\b\a\0=\b\n\a=\a\16\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0054\6\0\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\4B\2\2\1K\0\1\0\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\25file_ignore_patterns\1\t\0\0\19node_modules/*\rlegacy/*\20third_parties/*\16overrides/*\16__pycache__\f.github\14.DS_Store\15.gitignore\vborder\18layout_config\1\0\2\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\20prompt_position\btop\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\t\18prompt_prefix\n Ôê¢ \20layout_strategy\15horizontal\21sorting_strategy\14ascending\19color_devicons\2\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\b   \ruse_less\2\20selection_caret\n ‚ñ∂ \6n\1\0\0\6i\1\0\0\n<esc>\nclose\t<cr>\1\0\0\vcenter\19select_default\nsetup\14telescope\vaction\1\0\0\0\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/undotree"
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
  ["vim-grammarous"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-grammarous"
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
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-latex"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-textobj-latex"
  },
  ["vim-textobj-user"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-textobj-user"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lsp-status.nvim")
time([[Config for lsp-status.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vpreset\fdefault\14with_text\2\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nü\4\0\0\t\0\27\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\3\0004\5\3\0006\6\0\0'\b\15\0B\6\2\0029\6\16\6>\6\1\5>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0=\3\26\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\14nvim-tree\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rfiletype\rencoding\14lualine_c\vstatus\15lsp-status\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇµ\bÓÇ∑\23section_separators\1\3\0\0\bÓÇ¥\bÓÇ∂\1\0\a\18right_padding\3\1\17left_padding\3\1\fpadding\3\1\18icons_enabled\3\1\ntheme\fonedark\nupper\1\nlower\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\nΩ\t\0\0\4\0\"\00016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2=\2\21\0015\2\23\0005\3\22\0=\3\a\2=\2\24\0015\2\26\0005\3\25\0=\3\a\2=\2\27\1=\1\4\0006\0\0\0009\0\1\0005\1\29\0=\1\28\0006\0\0\0009\0\1\0005\1\31\0=\1\30\0006\0\0\0009\0 \0'\2!\0B\0\2\1K\0\1\0Gautocmd FileType dashboard highlight DashboardHeader guifg=#9999bb\bcmd\1\2\0\0\5\28dashboard_custom_footer\1\2\0\0\5\28dashboard_custom_header\15book_marks\1\0\1\fcommand\23:DashboardJumpMark\1\2\0\0CÔë° Jump to bookmarks                                         \14find_word\1\0\1\fcommand\23:DashboardFindWord\1\2\0\0CÔáÇ Find word                                                 \23change_colorscheme\1\0\1\fcommand :DashboardChangeColorscheme\1\2\0\0CÓà´ Change colorscheme                                        \rnew_file\1\0\1\fcommand\22:DashboardNewFile\1\2\0\0CÔÖõ New file                                                  \14find_file\1\0\1\fcommand\23:DashboardFindFile\1\2\0\0CÔÖú Find file                                                 \17find_history\1\0\1\fcommand\26:DashboardFindHistory\1\2\0\0CÔú° Recently opened files                                     \16buffer_list\1\0\0\16description\1\0\1\fcommand.:cd ~/.config/nvim | Telescope find_files\1\2\0\0CÓòï Config Files                                              \29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameV\0\2\6\0\5\0\14\18\4\1\0009\2\0\1'\5\1\0B\2\3\2\15\0\2\0X\3\2Ä'\2\2\0X\3\1Ä'\2\3\0'\3\4\0\18\4\2\0\18\5\0\0&\3\5\3L\3\2\0\5\tÔÅ± \tÔÅú \nerror\nmatchå\a\1\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\15highlights\14separator\1\0\1\nguifg\f#333333\22separator_visible\1\0\1\nguifg\f#333333\23separator_selected\1\0\1\nguifg\f#333333\20buffer_selected\1\0\1\nguifg\vorange\tfill\1\0\0\1\0\1\nguibg\f#333333\foptions\1\0\0\foffsets\1\0\3\15text_align\vcenter\rfiletype\rNvimTree\ttext\22Ôê¢ File Explorer\26diagnostics_indicator\0\19name_formatter\0\1\0\23\28show_buffer_close_icons\2\15close_icon\bÔÄç\24show_tab_indicators\1\18modified_icon\b‚óè\24persist_buffer_sort\1\22buffer_close_icon\bÔôï\27always_show_bufferline\1\19indicator_icon\b‚ñé\25enforce_regular_tabs\1\20separator_style\nslant\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\20show_close_icon\2\18close_command\16bdelete! %d\22show_buffer_icons\2\fnumbers\tnone\16diagnostics\rnvim_lsp\fsort_by\aid\rtab_size\3\6\22max_prefix_length\3\n\20max_name_length\3\15\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÌ\v\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\2\17follow_files\2\rinterval\3Ë\a\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\fnoremap\2\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<cr>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<cr>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\to ih::<c-u>lua require\"gitsigns.actions\".select_hunk()<cr>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\vbuffer\2\nsigns\1\0\5\18sign_priority\3\6\20update_debounce\3d\vlinehl\1\14word_diff\1\nnumhl\2\17changedelete\1\0\4\ttext\6~\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\vlinehl\21GitSignsDeleteLn\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b‚îÇ\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b‚îÇ\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim‡\1\0\0\5\0\a\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\4\0&\1\2\1L\1\2\0X\1\16Ä6\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\5\0&\3\4\3B\1\2\2\t\1\0\0X\1\5Ä\18\1\0\0'\2\5\0&\1\2\1L\1\2\0X\1\2Ä'\1\6\0L\1\2\0K\0\1\0\20/usr/bin/python\22/.venv/bin/python\21/venv/bin/python\15executable\vgetcwd\afn\bvim\2∑\4\1\0\5\0\19\0$6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0=\2\3\0019\1\2\0005\2\6\0005\3\a\0=\3\b\2=\2\5\0019\1\t\0004\2\3\0005\3\v\0003\4\f\0=\4\r\0034\4\0\0=\4\b\3>\3\1\2=\2\n\0019\1\t\0009\2\t\0009\2\n\2=\2\14\0019\1\t\0009\2\t\0009\2\n\2=\2\15\0019\1\t\0004\2\3\0005\3\16\0003\4\17\0=\4\18\3>\3\1\2=\2\5\1K\0\1\0\15pythonPath\0\1\0\4\fprogram\f${file}\frequest\vlaunch\tname\16Launch file\ttype\vpython\trust\6c\fprogram\0\1\0\6\16stopOnEntry\1\frequest\vlaunch\bcwd\23${workspaceFolder}\tname\vLaunch\18runInTerminal\1\ttype\tlldb\bcpp\19configurations\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\fcommand:/Users/fujimotogen/.pyenv/versions/debugpy/bin/python\ttype\15executable\vpython\1\0\3\tname\tlldb\fcommand(/usr/local/opt/llvm/bin/lldb-vscode\ttype\15executable\tlldb\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14:loadview\bcmd\bvim≥\6\1\0\n\0\30\0*6\0\0\0'\2\1\0B\0\2\0025\1\3\0003\2\2\0=\2\4\0016\2\0\0'\4\5\0B\2\2\0029\2\6\0025\4\28\0005\5\17\0005\6\r\0005\a\t\0009\b\a\0009\t\b\0 \b\t\b \b\1\b=\b\n\a9\b\v\0=\b\f\a=\a\14\0065\a\15\0009\b\v\0=\b\f\a9\b\a\0=\b\n\a=\a\16\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0054\6\0\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\4B\2\2\1K\0\1\0\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\25file_ignore_patterns\1\t\0\0\19node_modules/*\rlegacy/*\20third_parties/*\16overrides/*\16__pycache__\f.github\14.DS_Store\15.gitignore\vborder\18layout_config\1\0\2\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\20prompt_position\btop\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\t\18prompt_prefix\n Ôê¢ \20layout_strategy\15horizontal\21sorting_strategy\14ascending\19color_devicons\2\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\b   \ruse_less\2\20selection_caret\n ‚ñ∂ \6n\1\0\0\6i\1\0\0\n<esc>\nclose\t<cr>\1\0\0\vcenter\19select_default\nsetup\14telescope\vaction\1\0\0\0\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nó\4\0\0\6\0\26\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\n\0004\4\4\0005\5\v\0>\5\1\0045\5\f\0>\5\2\0045\5\r\0>\5\3\4=\4\14\3=\3\15\0025\3\16\0005\4\17\0=\4\14\3=\3\18\0025\3\19\0005\4\21\0005\5\20\0=\5\22\4=\4\t\3=\3\23\0025\3\24\0=\3\25\2B\0\2\1K\0\1\0\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\0\ttray\1\2\0\0\trepl\1\0\3\tsize\3\15\18open_on_start\2\rposition\vbottom\fsidebar\relements\1\0\2\aid\vstacks\tsize\4üäÆè\5∏Ω‘˛\3\1\0\2\aid\16breakpoints\tsize\4üäÆè\5∏Ω‘˛\3\1\0\2\aid\vscopes\tsize\4üäÆè\5∏Ω‘˛\3\1\0\3\tsize\3(\18open_on_start\2\rposition\nright\rmappings\vexpand\1\0\4\topen\6o\tedit\6e\vremove\6d\trepl\6r\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\2\14collapsed\b‚ñ∏\rexpanded\b‚ñæ\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17colo gruvbox\bcmd\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionÁÃô≥\6≥ÊÃ˛\3Ñ\3\1\0\5\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\rwinblend\3\3\vborder\vsingle\nshell\6o\bvim\20shade_filetypes\tsize\1\0\t\20insert_mappings\2\20start_in_insert\2\19shading_factor\r<number>\20shade_terminals\2\17hide_numbers\2\17open_mapping\n<m-w>\14direction\15horizontal\18close_on_exit\2\17persist_size\2\0\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n™\5\0\0\4\0\15\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\4\0005\1\6\0=\1\5\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\24char_highlight_list\1\v\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent1\27IndentBlanklineIndent2\20buftype_exclude\1\0\2\25space_char_blankline\6 \tchar\b‚îÇ\1\3\0\0\14dashboard\rmarkdown\nsetup\21indent_blankline\frequire\1\3\0\0\14dashboard\rmarkdown\31indentLine_fileTypeExclude\6gVautocmd FileType * highlight IndentBlanklineIndent2 guifg=#333333 blend=nocombineVautocmd FileType * highlight IndentBlanklineIndent1 guifg=#666666 blend=nocombine\bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nì\a\0\0\6\0)\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\n\0005\5\v\0=\5\f\4=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\0035\4\21\0005\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\4=\4\30\3=\3\31\0025\3!\0005\4 \0=\4\"\0035\4#\0=\4$\0035\4%\0005\5&\0=\5\f\4=\4'\3=\3(\2B\0\2\1K\0\1\0\rrefactor\17smart_rename\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\15<leader>sP\21@parameter.inner\14swap_next\1\0\1\15<leader>sp\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\1\0\4\aac\17@class.outer\aic\17@class.inner\aaf\20@function.outer\aif\20@function.inner\1\0\1\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\1\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÈ\n\0\0\3\0)\0g6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\0\0=\1\f\0006\0\0\0009\0\1\0)\1\0\0=\1\r\0006\0\0\0009\0\1\0)\1\0\0=\1\14\0006\0\0\0009\0\1\0)\1\1\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\17\0006\0\0\0009\0\1\0)\1\0\0=\1\18\0006\0\0\0009\0\1\0)\1\1\0=\1\19\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\1\0=\1\22\0006\0\0\0009\0\1\0005\1\25\0005\2\24\0=\2\26\0015\2\27\0=\2\28\1=\1\23\0006\0\0\0009\0\1\0005\1\30\0=\1\29\0006\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0005\2#\0=\2$\0015\2%\0=\2&\0015\2'\0=\2(\1=\1!\0K\0\1\0\blsp\1\0\4\thint\bÔÅ™\fwarning\bÔÅ±\nerror\bÔÅó\tinfo\bÔÅö\vfolder\1\0\b\topen\bÓóæ\17symlink_open\bÓóæ\17arrow_closed\bÔë†\15empty_open\bÔÑï\fdefault\bÓóø\fsymlink\bÔíÇ\nempty\bÔÑî\15arrow_open\bÔëº\bgit\1\0\a\runmerged\bÓúß\14untracked\b‚òÖ\vstaged\b‚úì\fdeleted\bÔëò\runstaged\b‚úó\fignored\b‚óå\frenamed\b‚ûú\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\1\0\4\18folder_arrows\3\1\nfiles\3\1\ffolders\3\1\bgit\3\1\25nvim_tree_show_icons\1\0\3\rMAKEFILE\3\1\rMakefile\3\1\14README.md\3\1\28nvim_tree_special_files\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\3\0\0\vpacker\aqf$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\24nvim_tree_auto_open\26nvim_tree_auto_resize\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n:\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\19UltiSnips#Anon\afn\bvim \1\0\2\5\0\n\0\0176\2\1\0'\4\2\0B\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2'\3\5\0009\4\0\1&\2\4\2=\2\0\0015\2\a\0009\3\b\0009\3\t\0038\2\3\2=\2\6\1L\1\2\0\tname\vsource\1\0\4\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\rnvim_lua\n[Lua]\18latex_symbols\f[Latex]\tmenu\6 \fdefault\fpresets\flspkind\frequire\tkindÔ\6\1\0\v\0000\3[6\0\0\0'\2\1\0B\0\2\2)\1(\0009\2\2\0005\4\4\0005\5\3\0=\5\5\0045\5\a\0003\6\6\0=\6\b\5=\5\t\0045\5\f\0009\6\n\0009\6\v\6B\6\1\2=\6\r\0059\6\n\0009\6\14\6B\6\1\2=\6\15\0059\6\n\0009\6\16\6)\b¸ˇB\6\2\2=\6\17\0059\6\n\0009\6\16\6)\b\4\0B\6\2\2=\6\18\0059\6\n\0009\6\19\6B\6\1\2=\6\20\0059\6\n\0009\6\21\6B\6\1\2=\6\22\0059\6\n\0009\6\23\0064\b\0\0B\6\2\2=\6\24\5=\5\n\0045\5\26\0005\6\25\0=\6\27\0056\6\28\0009\6\29\6\24\b\0\0016\t\30\0009\t\31\t9\t \t\24\n\0\1\24\n\1\n\25\n\2\n#\t\n\t\"\b\t\bB\6\2\2=\6!\0056\6\28\0009\6\29\0066\b\30\0009\b\31\b9\b\"\b#\b\b\1\"\b\b\1B\6\2\2=\6#\5=\5$\0044\5\a\0005\6%\0>\6\1\0055\6&\0>\6\2\0055\6'\0>\6\3\0055\6(\0>\6\4\0055\6)\0>\6\5\0055\6*\0>\6\6\5=\5+\0045\5-\0003\6,\0=\6.\5=\5/\4B\2\2\1K\0\1\0\15formatting\vformat\1\0\0\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\14ultisnips\1\0\1\tname\15treesitter\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\18documentation\14maxheight\nlines\rmaxwidth\fcolumns\6o\bvim\nfloor\tmath\vborder\1\0\1\17winhighlightDNormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\t<CR>\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\15completion\1\0\0\1\0\1\17autocomplete\2\nsetup\bcmp\frequire\4 \18\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\0¿\24nvim_buf_set_option\bapi\bvimê\14\1\1\r\0<\0û\0015\1\0\0005\2\1\0006\3\2\0\18\5\2\0B\3\2\4H\6\vÄ'\b\3\0\18\t\6\0&\b\t\b6\t\4\0009\t\5\t9\t\6\t\18\v\b\0005\f\a\0=\a\b\f=\b\t\fB\t\3\1F\6\3\3R\6Û6\3\4\0009\3\n\0039\3\v\0036\4\4\0009\4\n\0049\4\r\0046\6\4\0009\6\n\0069\6\v\0069\6\14\0065\a\15\0=\1\16\aB\4\3\2=\4\f\0036\3\4\0009\3\n\0039\3\v\0036\4\4\0009\4\n\0049\4\r\0046\6\4\0009\6\n\0069\6\v\0069\6\18\0065\a\19\0=\1\16\aB\4\3\2=\4\17\0033\3\20\0003\4\21\0\18\5\4\0'\a\22\0'\b\23\0B\5\3\0015\5\24\0\18\6\3\0'\b\25\0'\t\26\0'\n\27\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\28\0'\n\29\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\30\0'\n\31\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t \0'\n!\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t\"\0'\n#\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t$\0'\n%\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t&\0'\n'\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t(\0'\n)\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t*\0'\n+\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t,\0'\n-\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t.\0'\n/\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t0\0'\n1\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t2\0'\n3\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t4\0'\n5\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t6\0'\n7\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t8\0'\n9\0\18\v\5\0B\6\5\1\18\6\3\0'\b\25\0'\t:\0'\n;\0\18\v\5\0B\6\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<space>tdJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0\1\0\0\19signature_help\31textDocument/signatureHelp\vborder\1\0\0\nhover\twith\23textDocument/hover\rhandlers\blsp\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\bvim\23LspDiagnosticsSign\npairs\1\0\4\tHint\tÔ†µ \fWarning\tÔî© \16Information\tÔëâ \nError\tÔôô \1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ≥\a\1\0\17\0/\0U6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3'\4\6\0B\1\3\0026\2\a\0009\2\b\2\18\4\1\0'\5\t\0B\2\3\0016\2\a\0009\2\b\2\18\4\1\0'\5\n\0B\2\3\0013\2\v\0005\3\f\0005\4\r\0006\5\14\0\18\a\4\0B\5\2\4X\b\6Ä8\n\t\0009\n\15\n5\f\16\0=\2\17\f=\3\18\fB\n\2\1E\b\3\3R\b¯6\5\0\0'\a\1\0B\5\2\0029\5\19\0059\5\15\0055\a\21\0005\b\20\0=\b\22\a=\2\17\aB\5\2\1'\5\23\0\18\6\5\0'\a\24\0&\6\a\0066\a\0\0'\t\1\0B\a\2\0029\a\25\a9\a\15\a5\t\28\0005\n\26\0>\6\1\n\18\v\5\0'\f\27\0&\v\f\v>\v\3\n=\n\22\t=\2\17\t5\n,\0005\v\30\0005\f\29\0=\f\31\v5\f!\0005\r \0=\r\"\f=\f#\v5\f'\0006\r\2\0009\r$\r9\r%\r'\15&\0+\16\2\0B\r\3\2=\r(\f=\f)\v5\f*\0=\f+\v=\v-\n=\n.\tB\a\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\2\tpath\23/usr/local/bin/lua\fversion\vLuaJIT\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua#/bin/macOS/lua-language-server8/Users/fujimotogen/.local/tools/lua-language-server\bcmd\1\0\0\1\2\0\0002/Users/fujimotogen/.local/bin/zeta-note-macos\14zeta_note\nflags\14on_attach\1\0\0\nsetup\vipairs\1\15\0\0\nvimls\fpyright\rdockerls\rtsserver\thtml\ncssls\18rust_analyzer\vclangd\ntaplo\vjsonls\vtexlab\ngopls\vbashls\ncmake\1\0\1\26debounce_text_changes\3d\0\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neomake lua require("packer.load")({'neomake'}, { cmd = "Neomake", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Neomake! ++once lua require"packer.load"({'neomake'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'auto-pairs'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-grammarous', 'goyo.vim'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-grammarous', 'vim-markdown', 'emmet-vim', 'tagbar-markdown', 'vimtex', 'auto-pairs', 'nvim-markdown-preview', 'goyo.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'vim-grammarous', 'vim-markdown', 'emmet-vim', 'tagbar-markdown', 'vimtex', 'nvim-markdown-preview', 'goyo.vim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsv ++once lua require("packer.load")({'csv.vim'}, { ft = "tsv" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'auto-pairs'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'auto-pairs'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex', 'vimtex', 'auto-pairs'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'auto-pairs'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'auto-pairs'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp-path', 'compe-tmux', 'vim-vsnip', 'cmp-buffer', 'cmp-calc', 'cmp-nvim-lsp', 'cmp-nvim-ultisnips', 'cmp-treesitter'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
