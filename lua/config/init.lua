-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Vim Options »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
vim.cmd [[colo gruvbox]]
vim.cmd [[set fillchars+=vert:│]]
vim.cmd 'packadd! matchit'
-- vim.opt.backup = false
-- vim.opt.backupext = '.bak'
-- vim.opt.completeopt:remove('preview')
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
vim.opt.autoread = true
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.conceallevel = 1
vim.opt.concealcursor= 'nc'
vim.opt.cursorline = true
vim.opt.exrc = true
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
vim.opt.listchars = [[tab:»-,conceal:┊,trail:░,extends:»,precedes:«,nbsp:%]] -- ,eol:↲
vim.opt.modeline = true
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.runtimepath:append('~/.vim/custom_runtime')
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shortmess = 'acostTWI'
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.statusline = '2'
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undodir=[[/Users/fujimotogen/.vim/undo]]
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.g.python_host_prog='~/.pyenv/versions/neovim-2/bin/python'
vim.g.python3_host_prog='~/.pyenv/versions/neovim-3/bin/python' 

-- file type plugin
vim.opt.runtimepath:append('~/.vim/JpFormat.vim')
vim.opt.formatexpr=[[jpfmt#formatexpr()]]
vim.opt.formatexpr=[[jpvim#formatexpr()]]
vim.g.jpvim_remove_youon = 1

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Key mappings »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[let mapleader = "\<Space>"]]
vim.g.coc_snippet_next = '<c-j>'
vim.g.coc_snippet_prev = '<c-l>'
vim.api.nvim_set_keymap('i', '<c-[>', [[<c-[>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<esc>', [[<esc>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<down>', [[:m '>+1<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<up>', [[:m '>-2<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'ga', '<plug>(EasyAlign)', {noremap = false})
vim.api.nvim_set_keymap('n', 'ga', '<plug>(EasyAlign)', {noremap = false})
vim.api.nvim_set_keymap('n', '<c-y>', '5<c-y>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-e>', '5<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', '<plug>AirlineSelectNextTab', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-p>', '<plug>AirlineSelectPrevTab', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-q>', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>aa', ':Git add --all<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>am', ':silent Git commit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ap', ':Git push origin HEAD<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss', ':silent !open https://google.com -a /Applications/Safari.app<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>', '/<++><cr>:nohl<cr>c4l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('', 'S', '<Plug>(easymotion-bd-jk)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'S', '<Plug>(easymotion-overwin-line)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', ':Telescope current_buffer_fuzzy_find<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cn', ':cn<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cN', ':cp<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':Telescope git_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':Telescope git_branches<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gt', ':GitGutterToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qf', ':copen<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rf', ':set foldmethod=expr<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sw', ':SetWin<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ta', ':TagbarToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-t>',      ':ToggleTerm<cr>', {noremap = true, silent = true})
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
vim.api.nvim_set_keymap('t', '<c-t>', [[<c-\><c-n>:ToggleTerm<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>s', ':sort<cr>', {noremap = true, silent = true})

-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
-- inoremap <silent><expr> <c-space> coc#refresh()
-- inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
--                             " \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"


vim.api.nvim_set_keymap('i', '<c-j>', '<plug>(coc-snippets-expand)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('i', '<c-k>', '<Plug>(coc-snippets-expand-jump)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-k>', '<Plug>(coc-diagnostic-prev)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-j>', '<Plug>(coc-diagnostic-next)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('v', '<c-k>', '<Plug>(coc-snippets-select)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('v', '<leader>x', '<Plug>(coc-convert-snippet)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = false, silent = true})

vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('x', '<leader>f',  '<Plug>(coc-format-selected)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f',  '<Plug>(coc-format-selected)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('x', '<leader>at', '<Plug>(coc-codeaction-selected)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>at', '<Plug>(coc-codeaction-selected)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qq', '<Plug>(coc-fix-current)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cd', ':CocDiagnostics<cr>', {noremap = false, silent = true})

-- xmap if <Plug>(coc-funcobj-i)
-- omap if <Plug>(coc-funcobj-i)
-- xmap af <Plug>(coc-funcobj-a)
-- omap af <Plug>(coc-funcobj-a)
-- xmap ic <Plug>(coc-classobj-i)
-- omap ic <Plug>(coc-classobj-i)
-- xmap ac <Plug>(coc-classobj-a)
-- omap ac <Plug>(coc-classobj-a)

vim.api.nvim_set_keymap('n', '<C-c>', '<Plug>(coc-range-select)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('x', '<C-c>', '<Plug>(coc-range-select)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':call Show_documentation()<cr>', {noremap = true, silent = true})
if vim.fn.has('nvim-0.4.0') or vim.fn.has('patch-8.2.0750') == true then
  vim.api.nvim_set_keymap('n', '<C-f>', [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], {noremap = true, silent = true, nowait = true, expr = true})
  vim.api.nvim_set_keymap('n', '<C-b>', [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], {noremap = true, silent = true, nowait = true, expr = true})
  vim.api.nvim_set_keymap('i', '<C-f>', [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"]], {noremap = true, silent = true, nowait = true, expr = true})
  vim.api.nvim_set_keymap('i', '<C-b>', [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"]], {noremap = true, silent = true, nowait = true, expr = true})
  vim.api.nvim_set_keymap('v', '<C-f>', [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]], {noremap = true, silent = true, nowait = true, expr = true})
  vim.api.nvim_set_keymap('v', '<C-b>', [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]], {noremap = true, silent = true, nowait = true, expr = true})
end

vim.api.nvim_set_keymap('n', '<Leader>bo',   [[:!source ~/.config/zsh/custom_func.zsh && blackout<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cbin', [[:!source ~/.config/zsh/custom_func.zsh && change<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>cbif', [[:!source ~/.config/zsh/custom_func.zsh && change_f<cr><cr><C-l>]], {noremap = true, silent = true})

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « AutoCommands »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- vim.cmd [[autocmd BufEnter,FocusGained,InsertLeave * set cursorline]]
-- vim.cmd [[autocmd BufLeave,FocusLost,InsertEnter   * set nocursorline]]
vim.cmd [[autocmd ColorScheme * highlight Normal guibg=none]]
vim.cmd [[autocmd ColorScheme * highlight SignColumn guibg=none]]
vim.cmd [[autocmd ColorScheme * highlight EndOfBuffer guifg=#222222]]
vim.cmd [[autocmd ColorScheme * highlight VertSplit guibg=none]]
vim.cmd [[autocmd BufRead,BufNewFile *.[ch] nmap <silent><buffer> <Leader>f :silent CFamilyFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.[chi]pp nmap <buffer> <Leader>f :silent CFamilyFMT<CR>]]
vim.cmd [[autocmd FileType python nmap <buffer> <Leader>f :silen PEPFMT<CR>]]
vim.cmd [[autocmd FileType python compiler python]]
vim.cmd [[autocmd FileType qf setlocal nocursorline nonu norelativenumber]]
vim.cmd [[autocmd BufRead,BufNewFile *.rlib nmap <buffer> <Leader>f :silent RustFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.rs nmap <buffer> <Leader>f :silent RustFMT<CR>]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex nmap <Leader>r <Leader>ll<Leader>lv]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex setlocal filetype=tex]]
vim.cmd [[autocmd BufRead,BufNewFile *.wiki setlocal filetype=tex]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert]]
vim.cmd [[autocmd BufRead,BufNewFile *.tex vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert]]
vim.cmd [[autocmd FileType markdown let g:indentLine_enabled = 0]]
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]
vim.cmd [[
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufRead,BufNewFile * silent! loadview
augroup END]]

-- autocmd BufRead,BufNewFile *.cpp syntax match Entity "main" conceal cchar=
-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                    « FileType Specified Configurations »                        │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- Markdown
vim.cmd [[autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2 wrap]]
vim.cmd [[autocmd FileType markdown nnoremap o A<CR>]]
vim.cmd [[autocmd FileType markdown iabbrev [[ \left[ \right] <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev [. \left[ \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev (( \left( \right) <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev (. \left( \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev {{ \lbrace \rbrace <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown iabbrev {. \left\{ \right. <++><esc>BBhi]]
vim.cmd [[autocmd FileType markdown inoreabbrev $$$$ $$$$<++><esc>5hi<cr><cr><c-o>k]]

vim.cmd [[autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4]]
vim.cmd [[autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4]]
vim.cmd [[autocmd FileType qf setlocal wrap]]
vim.cmd [[autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap]]
vim.cmd [[autocmd FileType rust let g:rust_recommended_style = 1]]
vim.cmd [[autocmd FileType rust let g:rustfmt_autosave = 1]]
vim.cmd [[autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4]]
--- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Folding Configurations »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
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

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
