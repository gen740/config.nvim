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
  ["csv.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nŸ/\0\0\4\0\20\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\1=\1\4\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0006\0\0\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0Gautocmd FileType dashboard highlight DashboardHeader guifg=#9999bb\bcmd\0017\0\0i                               ommmmms                    +mmdmd`                                   i                               `hNNNNy:+ssso/..../osso+/-.hNNNN+                                    i                             ./oydmNNNhdds+::---::/ohdddNNNNNNo`                                    i                          `/yysydhNNNNmdmmmmmmmmmmmmmmmddmmmmdddho-                                 i            `-.       ```..../hmmddmmdmmmmmmmmmmmmmmmmmmmmmmmmmddyys-`        ``                    i           ommNd:  `/s+...:ohdmmmmmmdmmmmmmmmmmddmmmmmmmmmmmmmmmmds:..`..   :ydydy`                 i           dNNNNN+/hh+++shddddddddddddddddddddddydddddddddddddddddddy+:/oo-oNNNmmy`                 i           /mNNNNNmmddddddddddddddddddddddddddddhydddddddhddddddysdddddhhdmNNNNNN+                  i            `:hNmNNNdddddddddddddhdddddddddddddddyhdddddddhhddhsyhdddddddNNNNNNms::/-               i            .yh/hdmddddddddddddddyddddddddddddddddsdddddddddyysyddddddddddmdhNhso/:/s-              i           .s+.:dddddddddhddddddyhddddddddddddddddhoyyyyyyyyysssssssyyhdddddhhsos:  +/              i          ....:ydddddddddyddddddyddddddddddddddddddo+yyhhhhssyyyhdddddddddddddossh/ /+    `         i        `o-.:shddddddddddydddddhyddddddddddddddddddhyddddhsshddyhdddddddddddydhoshh::+  .+s-        i ``.`  `so+yhdddddddddddyhdddddhhdddddddddddddddddddyNdhhsyhddddyhdddhdddddhyydhsshs::`/+:s/        i/mhmmh/ohhddddhhddddddddyddddddyhddddddddddddddddhhdymNdsyhdddddhyddhyddmdhssosysosh/:+:``o+        i.dmNNNNNNmydhhyhhhhhdddhyddddddyhdhdddddddddddddhhshhhNNmdhddddddhyhhshddNdsoohys+/o//.  `o+        i .shhhmmNNhhhshhhyhhhhhhyhhhhhhyhhddhhhhhhhhhhhhhhshhyNNNNmhhhhhhhyhhshhhddooohhhh/+o--` `s/        i   ``.yyhhhhyyhhhshhhhhyshhhhhhyhhmmhhhhhhhhhhhhhhshhsmmmmmmhhhhhhhyhshhhhhss/hhyo/////+//s.        i     .yhhhhhshhhhshhhhhyshhhhhhyhhmNhdhhhhhhhhhhhhshh+hmmNNNNmdhhhhshshhhhhhs+sso+oo+o:.++-         i     /hhhhhhshhhhshhhhhyshhhhhhyhhdNhhhhhhhhhhhhhhshhydNNNNNNNNNdhhhyshhhhhhosssyosh+o+``//`        i     ohhhhhhshhhhyhhhhhhshhhhhhyhhhdhhhhhhhhhhhhhhsyhydNNNNNNNNNNNdhsshhhhhhh+yhoshho/o: `o-        i     shdhhhhshhhhshhhhhhshhhhhhyyhhhhhhhhhhhhhhhhhyyhydmNNNNNNNNNNNNdohhhhhhh/+ssshho+o+`.o-        i     yhNdhhhshhhhshhhhhhshhhhhhhyhhhhhddddddddddddyydodNmdy/oooshmmNNyhhhhyhh::+shhhos+o:+/         i     yhNdhhhshhhhhyhhhhhyhhhhhhhyhhhddddddddddddddyhdos+:`  `.o-:/+mNyhhhyyhy::osyhyoyooo:          i     yhmdhhhshhhhhshhhhhhsddddddyhdyddddddddddddddhhdo/+/ `..-/.`sysdhdddyhhs/osoosooysoo-          i     shhhhhhshhhhhyhhddddyhddddddydydmmmmmmmmmmmmmydmsmm-.:+::/:`:mdhddddyddymmNNyhyyhoo++          i     +hhhhhhyyhhhhhyddddddydddmmmhdhdmmmmmmmmmmmmmymddNN//oo:-oo-/NNhmddhddhddhdNhhhhhoo/o.         i     .yhhhhhhsddddhhhdddddhdmmmmmmhmhmmmmmmmmmmmmmymhNNNd+hhyhy+:dNNdmmdhmmhhhhhNdhhhhoo-s-         i      ohhhhhhyhdddhdhdmmmmmhmmmmmmddddmmmmmmmmmmmdhmhNNNNNmshddymNNdmmmhmmdmyhshNdhhhy+o.o:         i      -yhhhhhhsdmmdhmhmmmmmmhmmmmmmhmhmmmmmmmmmmmymhmNNNNNNNNmmNNNNhmmddmmdmyhhhNyhhh+++`+/         i       +hhhhhhyymmmdhdhmmmmmddmmmmmmhmhmmmmmmmmmddmhNNNNNNNNNNNNNNdmmddmmdmhhhhNd+yhy-o+`++         i       `shhhhhhyymmmdddhmmmmmdmmmmmmmhdhmmNNNNNNmNNNNNNNNNNNNNNNNNdmddmmdmyhhdNh//yy:.s/ /+         i        .yhhhhhhyymmmmddhmmmmmmmmmmNNNmNNNNNNNNNmNNNNNNNNNNNNNNNNmmmmNmmNmmNNmo::/yo`-y: /+         i         :yhhhhhhhyhmmmddhmmmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNddmmy/:-:os` /s. ++         i          /yyyhhhhhyyhdddmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNd//+/::-:/o. `o+  +/         i           :yysyhhhhhhyodNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/:-:::--:/.  -s- `o:         i            -syyssyhhhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/::-:-.--.`   /o` .s-         i             `/yy//+syhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNh/:::.``..`    `o/  -s.         i               -os+::/+ooo+ymNNNNNNNNNNNNNNNNNNNmNNNNNNNNNNNNNNNNNho:::::` ``      -o.  :o`         i                 -oo/::-::::+sdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmy+::-`...          /:  `++          i                   ./+/:--:::::/sdmNNNNNNNNNNNNNNNNNNNNNNNNNmho/:--`              .o.  .o/          i                     `.---...----:/oydmNNNNNNNNNNNNNNNNNNNmhy/-.``                //   -s-          i                              ````-:://++hdmmNNNNNNNNNNmhyhhy:-++/`              .o.   /o`          i                                  :hdNmh/yhhyhhhdddddhhhhhhhhsmmmNd.             //    --           i                                  dNNmmmdyyhhhhhhhhhhhhhhhhymNNNNdN:             -`                 i     `-:-``oy+.                   mNmmNNNNdyyhhyhhhhhhhyyhymNNNNNmd`                   .:/-   ````  i    /dNNNmhNNNNy:`                oNNNNNNNNhmNNNhyhhhhmNNymNNNNNNd-                 `:ymNNh:+yhdmdy-i   .NNNNNNNNNNNNNh/`              `hNNNNNNNNNNNNNdyyhNNNNNNNNNNNd:                 -hNNNmmmNNNNNNNN+i   -NNNNNNNNNNNNNNNoo+-`         -oymmNNNNNNNNNNNNyhNNNNNNNNNNNmmmy/--.```     `-:+NNNNNNNNNNNNNNNm:i   -NNNNNNNNNNNNNNmmNNNh:`  .:/+yNNNNmhNNNNNNNNNNNmNNNNNNNdNNNNNNNNNNNNmdhs:./ymNNhNNNNNNNNNNNNNNNs i   `dNNNNNNNNNNNNNmmNNNNNyosmNNNNNNNNNNNNNNNmNNNNNNNNNNNNdmNNNNNNNNNNNNNNNNhdNNNNNhNNNNNNNNNNNNNNd. i    +NNNNNNNNNNNNNNdmNNNNdddNNNNNNNNNNNNNNNNdhyyy/sydNNNNNNNNNNNNNNNNNNNNNmddNNNNdmNNNNNNNNNNNNNN/  i     hNNNNNNNNNNNNNdhmNNNmmdNNNNNNNNNNNNms/-..-/.```./+oshmNNNNNNNNNNNNNNNddNNNNddNNNNNNNNNNNNNNy`  i     .dNNNNNNNNNNNNhNNNNNNdhNNNNNNNNNNh/.`.+ymNs``-``+yo/..:+hNNNNNNNNNNNddNNNNdmNNNNNNNNNNNNNNh.   \28dashboard_custom_header\15book_marks\1\0\1\fcommand\23:DashboardJumpMark\1\2\0\0CÔë° Jump to bookmarks                                         \rnew_file\1\0\1\fcommand\22:DashboardNewFile\1\2\0\0CÔÖõ New file                                                  \16buffer_list\1\0\0\16description\1\0\1\fcommand.:cd ~/.config/nvim | Telescope find_files\1\2\0\0CÓòï Config Files                                              \29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n‰\f\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\2\rinterval\3Ë\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\vbuffer\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\fnoremap\2\nsigns\1\0\n\20update_debounce\3d\18sign_priority\3\6 current_line_blame_position\beol\29current_line_blame_delay\3Ë\a\23current_line_blame\1\nnumhl\2\vlinehl\1\22use_internal_diff\2\23use_decoration_api\2\14word_diff\1\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/goyo.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-status.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\22register_progress\15lsp-status\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n™\4\0\0\b\0\28\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\3\0006\5\0\0'\a\15\0B\5\2\0029\5\16\5>\5\1\0046\5\17\0>\5\2\4=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0=\3\27\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\14nvim-tree\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rfiletype\rencoding\14lualine_c\15Word_count\vstatus\15lsp-status\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇµ\bÓÇ∑\23section_separators\1\3\0\0\bÓÇ¥\bÓÇ∂\1\0\a\18right_padding\3\1\17left_padding\3\1\fpadding\3\1\18icons_enabled\3\1\ntheme\fonedark\nupper\1\nlower\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tname\31\0\4\a\0\2\0\5'\4\0\0\18\5\0\0'\6\1\0&\4\6\4L\4\2\0\6)\6(†\a\1\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\15highlights\14separator\1\0\1\nguifg\f#333333\22separator_visible\1\0\1\nguifg\f#333333\23separator_selected\1\0\1\nguifg\f#333333\20buffer_selected\1\0\1\nguifg\vorange\tfill\1\0\0\1\0\1\nguibg\f#333333\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\vcenter\26diagnostics_indicator\0\19name_formatter\0\1\0\25\16diagnostics\rnvim_lsp\23right_trunc_marker\bÔÇ©\28show_buffer_close_icons\1\22left_trunc_marker\bÔÇ®\20show_close_icon\1\15close_icon\bÔÄç\20separator_style\nslant\18modified_icon\b‚óè\27always_show_bufferline\2\22buffer_close_icon\bÔôï\25enforce_regular_tabs\1\19indicator_icon\b‚ñé\24persist_buffer_sort\1\24show_tab_indicators\1\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\22show_buffer_icons\2\18close_command\16bdelete! %d\17number_style\5\fsort_by\aid\fnumbers\tnone\rmappings\1\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\n’\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\b\rnvim_lsp\2\14ultisnips\2\nvsnip\2\rnvim_lua\2\tcalc\2\vbuffer\2\tpath\2\fluasnip\2\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\14max_width\3x\14min_width\3<\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\15min_height\3\1\1\t\0\0\b‚îå\b‚îÄ\b‚îê\b‚îÇ\b‚îò\b‚îÄ\b‚îî\b‚îÇ\1\0\f\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\19max_menu_width\3d\ndebug\1\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\20resolve_timeout\3†\6\nsetup\ncompe\frequireÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim‘\n\1\2\v\0(\0o3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b \0'\t!\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\"\0'\t#\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b$\0'\t%\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0Ë\t\1\0\17\0;\1z6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3'\4\6\0B\1\3\0026\2\a\0009\2\b\2\18\4\1\0'\5\t\0B\2\3\0016\2\a\0009\2\b\2\18\4\1\0'\5\n\0B\2\3\0013\2\v\0005\3\f\0006\4\r\0\18\6\3\0B\4\2\4X\a\aÄ8\t\b\0009\t\14\t5\v\15\0=\2\16\v5\f\17\0=\f\18\vB\t\2\1E\a\3\3R\a˜6\4\0\0'\6\1\0B\4\2\0029\4\19\0049\4\14\0045\6\21\0005\a\20\0=\a\22\6=\2\16\6B\4\2\1+\4\0\0006\5\2\0009\5\23\0059\5\24\5'\a\25\0B\5\2\2\t\5\0\0X\5\2Ä'\4\26\0X\5\21Ä6\5\2\0009\5\23\0059\5\24\5'\a\27\0B\5\2\2\t\5\0\0X\5\2Ä'\4\28\0X\5\fÄ6\5\2\0009\5\23\0059\5\24\5'\a\29\0B\5\2\2\t\5\0\0X\5\2Ä'\4\30\0X\5\3Ä6\5\31\0'\a \0B\5\2\1'\5!\0\18\6\5\0'\a\"\0\18\b\4\0'\t#\0&\6\t\0066\a\0\0'\t\1\0B\a\2\0029\a$\a9\a\14\a5\t'\0005\n%\0>\6\1\n\18\v\5\0'\f&\0&\v\f\v>\v\3\n=\n\22\t=\2\16\t5\n7\0005\v)\0005\f(\0=\f*\v5\f,\0005\r+\0=\r-\f=\f.\v5\f2\0006\r\2\0009\r/\r9\r0\r'\0151\0+\16\2\0B\r\3\2=\r3\f=\f4\v5\f5\0=\f6\v=\v8\n=\n9\tB\a\2\0016\a\2\0009\a\22\a'\t:\0B\a\2\1K\0\1\0f autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() \rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\2\tpath\23/usr/local/bin/lua\fversion\vLuaJIT\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\25/lua-language-server\n/bin/</Users/fujimotogen/home/Shelf/Tools/lua-language-server#Unsupported system for sumneko\nprint\fWindows\nwin32\nLinux\tunix\nmacOS\bmac\bhas\afn\bcmd\1\0\0\1\2\0\0002/Users/fujimotogen/.local/bin/zeta-note-macos\14zeta_note\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\1\0\0\nsetup\vipairs\1\f\0\0\nvimls\fpyright\rdockerls\rtsserver\thtml\18rust_analyzer\vdenols\vclangd\vtexlab\vbashls\ncmake\0\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14lspconfig\frequire\2\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÈ\n\0\0\3\0)\0g6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\0\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\r\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0)\1\1\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\17\0006\0\0\0009\0\1\0)\1\0\0=\1\18\0006\0\0\0009\0\1\0)\1\1\0=\1\19\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\1\0=\1\22\0006\0\0\0009\0\1\0005\1\25\0005\2\24\0=\2\26\0015\2\27\0=\2\28\1=\1\23\0006\0\0\0009\0\1\0005\1\30\0=\1\29\0006\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0005\2#\0=\2$\0015\2%\0=\2&\0015\2'\0=\2(\1=\1!\0K\0\1\0\blsp\1\0\4\thint\bÔÅ™\fwarning\bÔÅ±\tinfo\bÔÅö\nerror\bÔÅó\vfolder\1\0\b\15arrow_open\bÔëº\fsymlink\bÔíÇ\nempty\bÔÑî\fdefault\bÓóø\15empty_open\bÔÑï\17symlink_open\bÓóæ\17arrow_closed\bÔë†\topen\bÓóæ\bgit\1\0\a\14untracked\b‚òÖ\frenamed\b‚ûú\fdeleted\bÔëò\runmerged\bÓúß\fignored\b‚óå\vstaged\b‚úì\runstaged\b‚úó\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\1\0\4\18folder_arrows\3\1\ffolders\3\1\bgit\3\1\nfiles\3\1\25nvim_tree_show_icons\1\0\3\rMAKEFILE\3\1\rMakefile\3\1\14README.md\3\1\28nvim_tree_special_files\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\3\0\0\vpacker\aqf$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\24nvim_tree_auto_open\26nvim_tree_auto_resize\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n”\b\0\0\a\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\17\0005\4\f\0005\5\r\0005\6\14\0=\6\15\5=\5\16\4=\4\18\0035\4\19\0005\5\20\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0005\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\0045\5 \0=\5!\4=\4\"\3=\3#\0025\3%\0005\4$\0=\4&\0035\4'\0=\4(\0035\4)\0005\5*\0=\5\16\4=\4+\3=\3,\2B\0\2\1K\0\1\0\rrefactor\17smart_rename\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\1\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\15<leader>sP\21@parameter.inner\14swap_next\1\0\1\15<leader>sp\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\aiF\1\0\4\6c$(function_definition) @function\vpython$(function_definition) @function\tjava#(method_declaration) @function\bcpp$(function_definition) @function\1\0\4\aic\17@class.inner\aaf\20@function.outer\aif\20@function.inner\aac\17@class.outer\1\0\1\venable\2\26incremental_selection\1\0\1\venable\2\vindent\fdisable\1\4\0\0\6c\bcpp\vpython\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14:loadview\bcmd\bvim¿\6\1\0\n\0 \0.6\0\0\0'\2\1\0B\0\2\0025\1\3\0003\2\2\0=\2\4\0016\2\0\0'\4\5\0B\2\2\0029\2\6\0025\4\28\0005\5\17\0005\6\v\0005\a\t\0009\b\a\0009\t\b\0 \b\t\b \b\1\b=\b\n\a=\a\f\0065\a\14\0009\b\r\0=\b\15\a9\b\a\0=\b\n\a=\a\16\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0054\6\0\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\4B\2\2\0016\2\0\0'\4\5\0B\2\2\0029\2\30\2'\4\31\0B\2\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\25file_ignore_patterns\1\b\0\0\17node_modules\vlegacy\14overrides\16__pycache__\f.github\14.DS_Store\15.gitignore\vborder\18layout_config\1\0\2\20prompt_position\btop\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\t\20layout_strategy\15horizontal\21sorting_strategy\14ascending\19color_devicons\2\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\b   \ruse_less\2\20selection_caret\n ‚ñ∂ \18prompt_prefix\n Ôê¢ \6n\n<esc>\1\0\0\nclose\6i\1\0\0\t<cr>\1\0\0\vcenter\19select_default\nsetup\14telescope\vaction\1\0\0\0\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    after_files = { "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-gruvbox8"
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
    loaded = false,
    needs_bufread = false,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimdoc-ja"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-gruvbox8
time([[Setup for vim-gruvbox8]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\18colo gruvbox8\bcmd\bvim\0", "setup", "vim-gruvbox8")
time([[Setup for vim-gruvbox8]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\14:loadview\bcmd\bvim¿\6\1\0\n\0 \0.6\0\0\0'\2\1\0B\0\2\0025\1\3\0003\2\2\0=\2\4\0016\2\0\0'\4\5\0B\2\2\0029\2\6\0025\4\28\0005\5\17\0005\6\v\0005\a\t\0009\b\a\0009\t\b\0 \b\t\b \b\1\b=\b\n\a=\a\f\0065\a\14\0009\b\r\0=\b\15\a9\b\a\0=\b\n\a=\a\16\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0054\6\0\0=\6\23\0055\6\24\0=\6\25\0055\6\26\0=\6\27\5=\5\29\4B\2\2\0016\2\0\0'\4\5\0B\2\2\0029\2\30\2'\4\31\0B\2\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\0\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚îå\b‚îê\b‚îò\b‚îî\25file_ignore_patterns\1\b\0\0\17node_modules\vlegacy\14overrides\16__pycache__\f.github\14.DS_Store\15.gitignore\vborder\18layout_config\1\0\2\20prompt_position\btop\nwidth\4ö≥ÊÃ\tô≥¶ˇ\3\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\rmappings\1\0\t\20layout_strategy\15horizontal\21sorting_strategy\14ascending\19color_devicons\2\23selection_strategy\nreset\17initial_mode\vinsert\17entry_prefix\b   \ruse_less\2\20selection_caret\n ‚ñ∂ \18prompt_prefix\n Ôê¢ \6n\n<esc>\1\0\0\nclose\6i\1\0\0\t<cr>\1\0\0\vcenter\19select_default\nsetup\14telescope\vaction\1\0\0\0\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim‘\n\1\2\v\0(\0o3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\f\0'\t\r\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\14\0'\t\15\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\18\0'\t\19\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\22\0'\t\23\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\24\0'\t\25\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\26\0'\t\27\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\28\0'\t\29\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\30\0'\t\31\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b \0'\t!\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\"\0'\t#\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b$\0'\t%\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b&\0'\t'\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\r<space>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\r<space>e*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\14<space>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\14<space>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\14<space>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0Ë\t\1\0\17\0;\1z6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3'\4\6\0B\1\3\0026\2\a\0009\2\b\2\18\4\1\0'\5\t\0B\2\3\0016\2\a\0009\2\b\2\18\4\1\0'\5\n\0B\2\3\0013\2\v\0005\3\f\0006\4\r\0\18\6\3\0B\4\2\4X\a\aÄ8\t\b\0009\t\14\t5\v\15\0=\2\16\v5\f\17\0=\f\18\vB\t\2\1E\a\3\3R\a˜6\4\0\0'\6\1\0B\4\2\0029\4\19\0049\4\14\0045\6\21\0005\a\20\0=\a\22\6=\2\16\6B\4\2\1+\4\0\0006\5\2\0009\5\23\0059\5\24\5'\a\25\0B\5\2\2\t\5\0\0X\5\2Ä'\4\26\0X\5\21Ä6\5\2\0009\5\23\0059\5\24\5'\a\27\0B\5\2\2\t\5\0\0X\5\2Ä'\4\28\0X\5\fÄ6\5\2\0009\5\23\0059\5\24\5'\a\29\0B\5\2\2\t\5\0\0X\5\2Ä'\4\30\0X\5\3Ä6\5\31\0'\a \0B\5\2\1'\5!\0\18\6\5\0'\a\"\0\18\b\4\0'\t#\0&\6\t\0066\a\0\0'\t\1\0B\a\2\0029\a$\a9\a\14\a5\t'\0005\n%\0>\6\1\n\18\v\5\0'\f&\0&\v\f\v>\v\3\n=\n\22\t=\2\16\t5\n7\0005\v)\0005\f(\0=\f*\v5\f,\0005\r+\0=\r-\f=\f.\v5\f2\0006\r\2\0009\r/\r9\r0\r'\0151\0+\16\2\0B\r\3\2=\r3\f=\f4\v5\f5\0=\f6\v=\v8\n=\n9\tB\a\2\0016\a\2\0009\a\22\a'\t:\0B\a\2\1K\0\1\0f autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() \rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\2\tpath\23/usr/local/bin/lua\fversion\vLuaJIT\1\0\0\14/main.lua\1\3\0\0\0\a-E\16sumneko_lua\25/lua-language-server\n/bin/</Users/fujimotogen/home/Shelf/Tools/lua-language-server#Unsupported system for sumneko\nprint\fWindows\nwin32\nLinux\tunix\nmacOS\bmac\bhas\afn\bcmd\1\0\0\1\2\0\0002/Users/fujimotogen/.local/bin/zeta-note-macos\14zeta_note\nflags\1\0\1\26debounce_text_changes\3ñ\1\14on_attach\1\0\0\nsetup\vipairs\1\f\0\0\nvimls\fpyright\rdockerls\rtsserver\thtml\18rust_analyzer\vdenols\vclangd\vtexlab\vbashls\ncmake\0\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvim\14lspconfig\frequire\2\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\22register_progress\15lsp-status\frequire\0", "config", "lsp-status.nvim")
time([[Config for lsp-status.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n™\4\0\0\b\0\28\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0004\4\3\0005\5\n\0>\5\1\4=\4\f\0035\4\r\0=\4\14\0034\4\3\0006\5\0\0'\a\15\0B\5\2\0029\5\16\5>\5\1\0046\5\17\0>\5\2\4=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0=\3\27\2B\0\2\1K\0\1\0\15extensions\1\3\0\0\rquickfix\14nvim-tree\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rfiletype\rencoding\14lualine_c\15Word_count\vstatus\15lsp-status\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\1\0\tmode\nlower\2\foptions\1\0\0\25component_separators\1\3\0\0\bÓÇµ\bÓÇ∑\23section_separators\1\3\0\0\bÓÇ¥\bÓÇ∂\1\0\a\18right_padding\3\1\17left_padding\3\1\fpadding\3\1\18icons_enabled\3\1\ntheme\fonedark\nupper\1\nlower\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\nŸ/\0\0\4\0\20\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\1=\1\4\0006\0\0\0009\0\1\0005\1\17\0=\1\16\0006\0\0\0009\0\18\0'\2\19\0B\0\2\1K\0\1\0Gautocmd FileType dashboard highlight DashboardHeader guifg=#9999bb\bcmd\0017\0\0i                               ommmmms                    +mmdmd`                                   i                               `hNNNNy:+ssso/..../osso+/-.hNNNN+                                    i                             ./oydmNNNhdds+::---::/ohdddNNNNNNo`                                    i                          `/yysydhNNNNmdmmmmmmmmmmmmmmmddmmmmdddho-                                 i            `-.       ```..../hmmddmmdmmmmmmmmmmmmmmmmmmmmmmmmmddyys-`        ``                    i           ommNd:  `/s+...:ohdmmmmmmdmmmmmmmmmmddmmmmmmmmmmmmmmmmds:..`..   :ydydy`                 i           dNNNNN+/hh+++shddddddddddddddddddddddydddddddddddddddddddy+:/oo-oNNNmmy`                 i           /mNNNNNmmddddddddddddddddddddddddddddhydddddddhddddddysdddddhhdmNNNNNN+                  i            `:hNmNNNdddddddddddddhdddddddddddddddyhdddddddhhddhsyhdddddddNNNNNNms::/-               i            .yh/hdmddddddddddddddyddddddddddddddddsdddddddddyysyddddddddddmdhNhso/:/s-              i           .s+.:dddddddddhddddddyhddddddddddddddddhoyyyyyyyyysssssssyyhdddddhhsos:  +/              i          ....:ydddddddddyddddddyddddddddddddddddddo+yyhhhhssyyyhdddddddddddddossh/ /+    `         i        `o-.:shddddddddddydddddhyddddddddddddddddddhyddddhsshddyhdddddddddddydhoshh::+  .+s-        i ``.`  `so+yhdddddddddddyhdddddhhdddddddddddddddddddyNdhhsyhddddyhdddhdddddhyydhsshs::`/+:s/        i/mhmmh/ohhddddhhddddddddyddddddyhddddddddddddddddhhdymNdsyhdddddhyddhyddmdhssosysosh/:+:``o+        i.dmNNNNNNmydhhyhhhhhdddhyddddddyhdhdddddddddddddhhshhhNNmdhddddddhyhhshddNdsoohys+/o//.  `o+        i .shhhmmNNhhhshhhyhhhhhhyhhhhhhyhhddhhhhhhhhhhhhhhshhyNNNNmhhhhhhhyhhshhhddooohhhh/+o--` `s/        i   ``.yyhhhhyyhhhshhhhhyshhhhhhyhhmmhhhhhhhhhhhhhhshhsmmmmmmhhhhhhhyhshhhhhss/hhyo/////+//s.        i     .yhhhhhshhhhshhhhhyshhhhhhyhhmNhdhhhhhhhhhhhhshh+hmmNNNNmdhhhhshshhhhhhs+sso+oo+o:.++-         i     /hhhhhhshhhhshhhhhyshhhhhhyhhdNhhhhhhhhhhhhhhshhydNNNNNNNNNdhhhyshhhhhhosssyosh+o+``//`        i     ohhhhhhshhhhyhhhhhhshhhhhhyhhhdhhhhhhhhhhhhhhsyhydNNNNNNNNNNNdhsshhhhhhh+yhoshho/o: `o-        i     shdhhhhshhhhshhhhhhshhhhhhyyhhhhhhhhhhhhhhhhhyyhydmNNNNNNNNNNNNdohhhhhhh/+ssshho+o+`.o-        i     yhNdhhhshhhhshhhhhhshhhhhhhyhhhhhddddddddddddyydodNmdy/oooshmmNNyhhhhyhh::+shhhos+o:+/         i     yhNdhhhshhhhhyhhhhhyhhhhhhhyhhhddddddddddddddyhdos+:`  `.o-:/+mNyhhhyyhy::osyhyoyooo:          i     yhmdhhhshhhhhshhhhhhsddddddyhdyddddddddddddddhhdo/+/ `..-/.`sysdhdddyhhs/osoosooysoo-          i     shhhhhhshhhhhyhhddddyhddddddydydmmmmmmmmmmmmmydmsmm-.:+::/:`:mdhddddyddymmNNyhyyhoo++          i     +hhhhhhyyhhhhhyddddddydddmmmhdhdmmmmmmmmmmmmmymddNN//oo:-oo-/NNhmddhddhddhdNhhhhhoo/o.         i     .yhhhhhhsddddhhhdddddhdmmmmmmhmhmmmmmmmmmmmmmymhNNNd+hhyhy+:dNNdmmdhmmhhhhhNdhhhhoo-s-         i      ohhhhhhyhdddhdhdmmmmmhmmmmmmddddmmmmmmmmmmmdhmhNNNNNmshddymNNdmmmhmmdmyhshNdhhhy+o.o:         i      -yhhhhhhsdmmdhmhmmmmmmhmmmmmmhmhmmmmmmmmmmmymhmNNNNNNNNmmNNNNhmmddmmdmyhhhNyhhh+++`+/         i       +hhhhhhyymmmdhdhmmmmmddmmmmmmhmhmmmmmmmmmddmhNNNNNNNNNNNNNNdmmddmmdmhhhhNd+yhy-o+`++         i       `shhhhhhyymmmdddhmmmmmdmmmmmmmhdhmmNNNNNNmNNNNNNNNNNNNNNNNNdmddmmdmyhhdNh//yy:.s/ /+         i        .yhhhhhhyymmmmddhmmmmmmmmmmNNNmNNNNNNNNNmNNNNNNNNNNNNNNNNmmmmNmmNmmNNmo::/yo`-y: /+         i         :yhhhhhhhyhmmmddhmmmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNddmmy/:-:os` /s. ++         i          /yyyhhhhhyyhdddmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNd//+/::-:/o. `o+  +/         i           :yysyhhhhhhyodNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/:-:::--:/.  -s- `o:         i            -syyssyhhhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/::-:-.--.`   /o` .s-         i             `/yy//+syhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNh/:::.``..`    `o/  -s.         i               -os+::/+ooo+ymNNNNNNNNNNNNNNNNNNNmNNNNNNNNNNNNNNNNNho:::::` ``      -o.  :o`         i                 -oo/::-::::+sdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmy+::-`...          /:  `++          i                   ./+/:--:::::/sdmNNNNNNNNNNNNNNNNNNNNNNNNNmho/:--`              .o.  .o/          i                     `.---...----:/oydmNNNNNNNNNNNNNNNNNNNmhy/-.``                //   -s-          i                              ````-:://++hdmmNNNNNNNNNNmhyhhy:-++/`              .o.   /o`          i                                  :hdNmh/yhhyhhhdddddhhhhhhhhsmmmNd.             //    --           i                                  dNNmmmdyyhhhhhhhhhhhhhhhhymNNNNdN:             -`                 i     `-:-``oy+.                   mNmmNNNNdyyhhyhhhhhhhyyhymNNNNNmd`                   .:/-   ````  i    /dNNNmhNNNNy:`                oNNNNNNNNhmNNNhyhhhhmNNymNNNNNNd-                 `:ymNNh:+yhdmdy-i   .NNNNNNNNNNNNNh/`              `hNNNNNNNNNNNNNdyyhNNNNNNNNNNNd:                 -hNNNmmmNNNNNNNN+i   -NNNNNNNNNNNNNNNoo+-`         -oymmNNNNNNNNNNNNyhNNNNNNNNNNNmmmy/--.```     `-:+NNNNNNNNNNNNNNNm:i   -NNNNNNNNNNNNNNmmNNNh:`  .:/+yNNNNmhNNNNNNNNNNNmNNNNNNNdNNNNNNNNNNNNmdhs:./ymNNhNNNNNNNNNNNNNNNs i   `dNNNNNNNNNNNNNmmNNNNNyosmNNNNNNNNNNNNNNNmNNNNNNNNNNNNdmNNNNNNNNNNNNNNNNhdNNNNNhNNNNNNNNNNNNNNd. i    +NNNNNNNNNNNNNNdmNNNNdddNNNNNNNNNNNNNNNNdhyyy/sydNNNNNNNNNNNNNNNNNNNNNmddNNNNdmNNNNNNNNNNNNNN/  i     hNNNNNNNNNNNNNdhmNNNmmdNNNNNNNNNNNNms/-..-/.```./+oshmNNNNNNNNNNNNNNNddNNNNddNNNNNNNNNNNNNNy`  i     .dNNNNNNNNNNNNhNNNNNNdhNNNNNNNNNNh/.`.+ymNs``-``+yo/..:+hNNNNNNNNNNNddNNNNdmNNNNNNNNNNNNNNh.   \28dashboard_custom_header\15book_marks\1\0\1\fcommand\23:DashboardJumpMark\1\2\0\0CÔë° Jump to bookmarks                                         \rnew_file\1\0\1\fcommand\22:DashboardNewFile\1\2\0\0CÔÖõ New file                                                  \16buffer_list\1\0\0\16description\1\0\1\fcommand.:cd ~/.config/nvim | Telescope find_files\1\2\0\0CÓòï Config Files                                              \29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tname\31\0\4\a\0\2\0\5'\4\0\0\18\5\0\0'\6\1\0&\4\6\4L\4\2\0\6)\6(†\a\1\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0003\4\4\0=\4\5\0033\4\6\0=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\15highlights\14separator\1\0\1\nguifg\f#333333\22separator_visible\1\0\1\nguifg\f#333333\23separator_selected\1\0\1\nguifg\f#333333\20buffer_selected\1\0\1\nguifg\vorange\tfill\1\0\0\1\0\1\nguibg\f#333333\foptions\1\0\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\vcenter\26diagnostics_indicator\0\19name_formatter\0\1\0\25\16diagnostics\rnvim_lsp\23right_trunc_marker\bÔÇ©\28show_buffer_close_icons\1\22left_trunc_marker\bÔÇ®\20show_close_icon\1\15close_icon\bÔÄç\20separator_style\nslant\18modified_icon\b‚óè\27always_show_bufferline\2\22buffer_close_icon\bÔôï\25enforce_regular_tabs\1\19indicator_icon\b‚ñé\24persist_buffer_sort\1\24show_tab_indicators\1\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\22show_buffer_icons\2\18close_command\16bdelete! %d\17number_style\5\fsort_by\aid\fnumbers\tnone\rmappings\1\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n‰\f\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\2\rinterval\3Ë\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\vbuffer\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\fnoremap\2\nsigns\1\0\n\20update_debounce\3d\18sign_priority\3\6 current_line_blame_position\beol\29current_line_blame_delay\3Ë\a\23current_line_blame\1\nnumhl\2\vlinehl\1\22use_internal_diff\2\23use_decoration_api\2\14word_diff\1\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6_\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\b‚îÇ\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\b‚îÇ\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n”\b\0\0\a\0-\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\17\0005\4\f\0005\5\r\0005\6\14\0=\6\15\5=\5\16\4=\4\18\0035\4\19\0005\5\20\0=\5\21\0045\5\22\0=\5\23\4=\4\24\0035\4\25\0005\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\0045\5 \0=\5!\4=\4\"\3=\3#\0025\3%\0005\4$\0=\4&\0035\4'\0=\4(\0035\4)\0005\5*\0=\5\16\4=\4+\3=\3,\2B\0\2\1K\0\1\0\rrefactor\17smart_rename\1\0\1\17smart_rename\bgrr\1\0\1\venable\2\28highlight_current_scope\1\0\1\venable\1\26highlight_definitions\1\0\0\1\0\1\venable\1\16textobjects\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\venable\2\14set_jumps\2\tswap\18swap_previous\1\0\1\15<leader>sP\21@parameter.inner\14swap_next\1\0\1\15<leader>sp\21@parameter.inner\1\0\1\venable\2\vselect\1\0\0\fkeymaps\aiF\1\0\4\6c$(function_definition) @function\vpython$(function_definition) @function\tjava#(method_declaration) @function\bcpp$(function_definition) @function\1\0\4\aic\17@class.inner\aaf\20@function.outer\aif\20@function.inner\aac\17@class.outer\1\0\1\venable\2\26incremental_selection\1\0\1\venable\2\vindent\fdisable\1\4\0\0\6c\bcpp\vpython\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÈ\n\0\0\3\0)\0g6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0)\1\1\0=\1\v\0006\0\0\0009\0\1\0)\1\0\0=\1\f\0006\0\0\0009\0\1\0)\1\1\0=\1\r\0006\0\0\0009\0\1\0)\1\1\0=\1\14\0006\0\0\0009\0\1\0)\1\1\0=\1\15\0006\0\0\0009\0\1\0)\1\1\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\17\0006\0\0\0009\0\1\0)\1\0\0=\1\18\0006\0\0\0009\0\1\0)\1\1\0=\1\19\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\1\0=\1\22\0006\0\0\0009\0\1\0005\1\25\0005\2\24\0=\2\26\0015\2\27\0=\2\28\1=\1\23\0006\0\0\0009\0\1\0005\1\30\0=\1\29\0006\0\0\0009\0\1\0005\1 \0=\1\31\0006\0\0\0009\0\1\0005\1\"\0005\2#\0=\2$\0015\2%\0=\2&\0015\2'\0=\2(\1=\1!\0K\0\1\0\blsp\1\0\4\thint\bÔÅ™\fwarning\bÔÅ±\tinfo\bÔÅö\nerror\bÔÅó\vfolder\1\0\b\15arrow_open\bÔëº\fsymlink\bÔíÇ\nempty\bÔÑî\fdefault\bÓóø\15empty_open\bÔÑï\17symlink_open\bÓóæ\17arrow_closed\bÔë†\topen\bÓóæ\bgit\1\0\a\14untracked\b‚òÖ\frenamed\b‚ûú\fdeleted\bÔëò\runmerged\bÓúß\fignored\b‚óå\vstaged\b‚úì\runstaged\b‚úó\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\1\0\4\18folder_arrows\3\1\ffolders\3\1\bgit\3\1\nfiles\3\1\25nvim_tree_show_icons\1\0\3\rMAKEFILE\3\1\rMakefile\3\1\14README.md\3\1\28nvim_tree_special_files\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\3\0\0\vpacker\aqf$nvim_tree_window_picker_exclude\25nvim_tree_update_cwd\6 \27nvim_tree_icon_padding\28nvim_tree_hijack_cursor$nvim_tree_disable_window_picker\30nvim_tree_lsp_diagnostics\26nvim_tree_group_empty\27nvim_tree_add_trailing\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\24nvim_tree_auto_open\26nvim_tree_auto_resize\a:~#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":AsyncRun") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file AsyncRun lua require("packer.load")({'asyncrun.vim'}, { cmd = "AsyncRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'csv.vim'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsv ++once lua require("packer.load")({'csv.vim'}, { ft = "tsv" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex', 'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'previm', 'tagbar-markdown', 'goyo.vim', 'vim-latex', 'vimtex', 'emmet-vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'previm', 'tagbar-markdown', 'goyo.vim', 'vimtex', 'emmet-vim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'goyo.vim'}, { ft = "text" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe', 'ultisnips'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-commentary', 'vim-easy-align', 'vim-easymotion'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/csv.vim/ftdetect/csv.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/fujimotogen/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
