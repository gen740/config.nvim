-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Vim Options »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
vim.g.python3_host_prog='~/.pyenv/versions/neovim-3/bin/python'
vim.g.python_host_prog='~/.pyenv/versions/neovim-2/bin/python'

vim.g.enc = 'utf-8'
vim.g.fileencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.concealcursor= 'c'
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,conceal:│,trail:▒,extends:»,precedes:«,nbsp:%,eol:↲]] -- ,eol:↲
vim.opt.modeline = true
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.runtimepath:append('~/.config/nvim/custom_runtime')
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shiftwidth = 4
vim.opt.shortmess = 'acostTWI'
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir=[[/Users/fujimotogen/.vim/undo]]
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wrap = false
-- vim.opt.backup = false
-- vim.opt.backupext = '.bak'
-- vim.opt.completeopt = "menuone,noselect"
-- vim.opt.display = 'lastline'
-- vim.opt.iskeyword:remove(':')
-- vim.opt.matchtime = 5
-- vim.opt.path:append([[**]])
-- vim.opt.showmatch = true
-- vim.opt.tags = '.tags;~'
-- vim.opt.wildmenu = true
-- vim.opt.wildmode:append([[full]])
-- vim.opt.wildmode:append([[longest]])
-- vim.opt.writebackup = false

-- forNeovide
vim.o.guifont = 'HackGenNerd Console:h13'
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_fullscreen = 1
vim.g.neovide_cursor_vfx_particle_density = 50
vim.g.neovide_transparency=0.8
vim.g.neovide_cursor_vfx_particle_lifetime=5
vim.g.neovide_cursor_animation_length=0.02
vim.g.neovide_cursor_trail_length=100

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Key mappings »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[let mapleader = "\<Space>"]]
vim.api.nvim_set_keymap('i', '<c-[>', [[<c-[>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<esc>', [[<esc>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<down>', [[:m '>+1<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<up>', [[:m '>-2<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'ga', '<plug>(EasyAlign)', {noremap = false})
vim.api.nvim_set_keymap('n', 'ga', '<plug>(EasyAlign)', {noremap = false})
vim.api.nvim_set_keymap('n', '<c-y>', '5<c-y>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-e>', '5<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', ':bn<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-p>', ':bp<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-q>', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>aa', ':Git add --all<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>am', ':silent Git commit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ap', ':Git push origin HEAD<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss', ':silent !open https://google.com -a /Applications/Safari.app<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>', '/<++><cr>:nohl<cr>c4l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'S', '<Plug>(easymotion-overwin-line)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', ':Telescope current_buffer_fuzzy_find<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cn', ':cn<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cN', ':cp<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':Telescope git_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':Telescope git_branches<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qf', ':copen<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rf', ':set foldmethod=expr<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sw', ':SetWin<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ta', ':TagbarToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tb',      ':ToggleTerm<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bb', ':ToggleTerminalBottom<cr>i', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tp', ':!open /Applications/Typora.app %<cr><cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ut', ':UndotreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>vq', ':vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>?',  ':vertical split<cr>:view ~/.config/nvim/keymap.md<cr>:setlocal nomodifiable nobuflisted<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>',  ':vertical resize -2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize +2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>',  ':resize +2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Up>',    ':resize -2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rr', ':silent AsyncRun make run<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rb', ':silent AsyncRun make build<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rt', ':silent AsyncRun make test<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-M-n>', [[<c-\><c-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<esc>', [[<c-\><c-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<c-t>', [[<c-\><c-n>:ToggleTerm<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>s', ':sort<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bo',   [[:!source ~/.config/zsh/custom_func.zsh && blackout<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cbin', [[:!source ~/.config/zsh/custom_func.zsh && change<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cbif', [[:!source ~/.config/zsh/custom_func.zsh && change_f<cr><cr><C-l>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'Q', [[<nop>]], {noremap = true, silent = true})

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « AutoCommands »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[autocmd WinEnter, BufEnter,FocusGained,InsertLeave * set cursorline]]
vim.cmd [[autocmd BufLeave,FocusLost,InsertEnter * set nocursorline]]
vim.cmd [[autocmd ColorScheme * hi Normal guibg=none]]
vim.cmd [[autocmd ColorScheme * hi SignColumn guibg=none]]
vim.cmd [[autocmd ColorScheme * hi EndOfBuffer guifg=#222222]]
vim.cmd [[autocmd ColorScheme * hi VertSplit guibg=none]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAdd guifg=lightblue]] -- 9999ff
vim.cmd [[autocmd ColorScheme * hi CompeDocumentation guibg=none]]
vim.cmd [[autocmd ColorScheme * hi CompeDocumentationBorder guibg=none]]
vim.cmd [[autocmd ColorScheme * hi BufferLineSeparator guifg=#333333]]
vim.cmd [[autocmd ColorScheme * hi BufferLineSeparatorSelected guifg=#333333]]
vim.cmd [[autocmd ColorScheme * hi EasyMotionTarget  guifg=yellow]]

vim.cmd [[autocmd ColorScheme * hi GitSignsAdd      guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAddNr    guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAddLn    guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChange   guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChangeNr guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChangeLn guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDelete   guibg=none  guifg=red]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDeleteNr guibg=none  guifg=red]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDeleteLn guibg=none  guifg=red]]

vim.cmd [[autocmd InsertEnter * hi lualine_c_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_c_normal_to_lualine_b_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_b_normal_to_lualine_c_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_x_normal_to_lualine_y_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_x_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_y_normal guibg=none]]
vim.cmd [[autocmd InsertEnter * hi lualine_x_DevIconLua_normal guibg=none]]

vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

-- vim.cmd [[au BufWinLeave *.* silent! mkview]]
-- vim.cmd [[au BufWinEnter *.* silent loadview]]

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                    « FileType Specified Configurations »                        │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

-- Markdown
vim.cmd [[autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 wrap]]
vim.cmd [[autocmd FileType markdown nnoremap o A<CR>]]
vim.cmd [[autocmd FileType markdown iabbrev [[ \left[ \right] <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev [. \left[ \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev (( \left( \right) <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev (. \left( \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev {{ \lbrace \rbrace <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev {. \left\{ \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown inoreabbrev $$$$ $$$$<++><esc>5hi<cr><esc>k$a]]
vim.cmd [[autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4]]
vim.cmd [[autocmd FileType python nmap <buffer> <Leader>f :silen PEPFMT<CR>]]
vim.cmd [[autocmd FileType python compiler python]]
vim.cmd [[autocmd FileType cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2]]
vim.cmd [[autocmd FileType c setlocal tabstop=2 softtabstop=2 shiftwidth=2]]
vim.cmd [[autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2]]
vim.cmd [[autocmd FileType qf setlocal wrap]]
vim.cmd [[autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap]]
vim.cmd [[autocmd FileType rust let g:rust_recommended_style = 1]]
vim.cmd [[autocmd FileType rust let g:rustfmt_autosave = 1]]
vim.cmd [[autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4]]
vim.cmd [[autocmd FileType qf setlocal nocursorline nonu norelativenumber]]

vim.cmd [[autocmd BufRead,BufNewFile *.[ch] nmap <silent><buffer> <Leader>f :silent CFamilyFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.[chi]pp nmap <buffer> <Leader>f :silent CFamilyFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.rlib nmap <buffer> <Leader>f :silent RustFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.rs nmap <buffer> <Leader>f :silent RustFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex nmap <Leader>r <Leader>ll<Leader>lv]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex setlocal filetype=tex]]
vim.cmd [[autocmd BufRead,BufNewFile *.wiki setlocal filetype=tex]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert]]
--- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Folding Configurations »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

-- local api = vim.api # TODO
-- local fn = vim.fn
-- if vim.fn.has('folding') == 1 then
--   print(vim.api.nvim_get_option('fillchars'))
--   function _G.MyFoldText()
--     local numwidth = api.nvim_win_get_option(0, 'numberwidth')

--     if api.nvim_win_get_option(0, 'foldmethod') == 'diff' then
--       local linetext = ''
--       local foldtext = '----------' .. (api.nvim_get_vvar('foldend') -
--       api.nvim_get_vvar('foldstart') + 1) .. 'lines the same ----------'
--       local align = fn.winwidth(0) - api.nvim_win_get_option(0, 'foldcolumn') -  0
--     end
--   end
-- end

vim.cmd [[
if has("folding")
    set foldtext=MyFoldText()
    function! MyFoldText()
        " for now, just don't try if version isn't 7 or higher
        if v:version < 701
            return foldtext()
        endif
        " clear fold from fillchars to set it up the way we want later
        let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
        let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
        if &fdm=='diff'
            let l:linetext=''
            let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
            let l:align = (l:align / 2) + (strwidth(l:foldtext)/2)
            " note trailing space on next line
            setlocal fillchars+=fold:\
        elseif !exists('b:foldpat') || b:foldpat==0
            let l:foldtext = '┈ '.(v:foldend-v:foldstart).' ﲐ'.' ┠'
            let l:endofline = 106 " (&textwidth>0 ? &textwidth : 100 + 6)
            let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strwidth(l:foldtext))
            let l:align = l:endofline-strwidth(l:linetext)
            setlocal fillchars+=fold:─ " 空白
        elseif b:foldpat==1
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
            let l:foldtext = ' '.v:folddashes
            let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
            let l:linetext .= '▤ × '.(v:foldend-v:foldstart-1).' lines--- '
            let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
            let l:linetext = strpart(l:linetext,0,l:align-strwidth(l:foldtext))
            let l:align -= strwidth(l:linetext)
            setlocal fillchars+=fold:-
        endif
        return printf('%s%*s', l:linetext, l:align, l:foldtext)
    endfunction
endif

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd FileType vim setlocal foldmethod=marker
" autocmd FileType zsh setlocal foldmethod=marker
autocmd BufRead,BufNewFile *.zprofile setlocal foldmethod=marker
set viewoptions-=options
autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl
]]
-- vim:set foldmethod=marker:
-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
