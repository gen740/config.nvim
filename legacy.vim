
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                            « Dein Settings »                                      │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')
  let s:config_dir     = expand('~/.config/nvim')
  let s:toml_file      = s:config_dir . '/plugins.toml'
  let s:lazy_toml_file = s:config_dir . '/lazy_plugins.toml'
  call dein#load_toml(s:toml_file, {'lazy': 0})  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})  " TOML を読み込み、キャッシュしておく
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
  call dein#install()
endif

" call map(dein#check_clean(), "delete(v:val, 'rf')")
" call dein#recache_runtimepath()

" }}}
lua require('config')
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                         « Python Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼

"}}}

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                        « Folding Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
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

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufRead,BufNewFile * silent! loadview
augroup END

set viewoptions-=options
autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl 

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                           « FileType Plugins »                                    │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
set runtimepath+=~/.vim/JpFormat.vim
set formatexpr=jpfmt#formatexpr()
set formatexpr=jpvim#formatexpr()
let g:jpvim_remove_youon = 1 

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                            « Leader Settings »                                    │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
let mapleader = "\<Space>"                       " LeaderキーをSpaceに
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-l>' 

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « Key mappings »                                     │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
inoremap <silent> <C-[> <C-[>:silent call custom#change_ime('eisu')<CR>
inoremap <silent> <esc> <esc>:silent call custom#change_ime('eisu')<CR>
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap ƒ :call custom#japanese('f')<CR>
nmap Ï :call custom#japanese('F')<CR>
nmap † :call custom#japanese('t')<CR>
nmap ˇ :call custom#japanese('T')<CR>
nmap <silent> g/ :silent call custom#japanese_search('/')<CR>
nmap <silent> g? :silent call custom#japanese_search('?')<CR>
nmap <silent> <C-n> <Plug>AirlineSelectNextTab
nmap <silent> <C-p> <Plug>AirlineSelectPrevTab
nmap <silent> <C-q> :Fern . -reveal=%<CR>
nmap <silent> <Leader>aa :Git add --all<CR>
nmap <silent> <Leader>am :silent Git commit<CR>
nmap <silent> <Leader>ap :Git push origin HEAD<CR>
nmap <silent> <Leader>ss :silent !open https://google.com -a /Applications/Safari.app<CR>
nmap s <Plug>(easymotion-overwin-f2)
map S <Plug>(easymotion-bd-jk)
nmap S <Plug>(easymotion-overwin-line)
nmap <silent> <Leader>bl :BLines!<CR>
nmap <silent> <Leader>cN :cp<CR>
nmap <silent> <Leader>ccc :resize 50<CR>
nmap <silent> <Leader>cn :cn<CR>
nmap <silent> <Leader>co :e ~/.config/nvim/init.vim<CR>
" nmap <silent> <Leader>df :FzfPreviewDirectoryFiles<CR>
" nmap <silent> <Leader>gb :FzfPreviewGitBranches<CR>
" nmap <silent> <Leader>gf :FzfPreviewGitFiles<CR>
" nmap <silent> <Leader>gs :FzfPreviewGitStatus<CR>
" nmap <silent> <Leader>gaf :FzfPreviewAllBuffers<CR>
nnoremap <silent> <leader>ts :Telescope 
nnoremap <silent> <leader>tf :Telescope find_files<cr>
nnoremap <silent> <leader>gf :Telescope git_files<cr>
nnoremap <silent> <leader>gb :Telescope git_branches<cr>
nmap <silent> <Leader>qf :copen<CR>
nmap <silent> <Leader>rf :set foldmethod=expr<CR>
nmap <silent> <Leader>sw :SetWin<CR>
nmap <silent> <Leader>ta :TagbarToggle<CR>
nmap <silent> <C-t> :ToggleTerminalTop<CR>i
nmap <silent> <Leader>bb :ToggleTerminalBottom<CR>i
nmap <silent> <Leader>tp :!open /Applications/Typora.app %<CR><CR>
nmap <silent> <Leader>ut :UndotreeToggle<CR>
nmap <silent> <Leader>vq :vertical copen<CR>:vertical resize 80<CR>:wincmd h<CR>
nmap <silent> <Leader>? :vertical split<CR>:view ~/.config/nvim/keymap.md<CR>
            \:setlocal nomodifiable nobuflisted<CR>
nnoremap <Leader>lsy :hi Conceal guifg=#dddddd<CR>
nnoremap <Leader>lsn :hi Conceal guifg=#555555<CR> 
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Up> :resize -2<CR>
noremap <Leader>rr :silent AsyncRun make run<CR>
noremap <Leader>rb :silent AsyncRun make build<CR>
noremap <Leader>rt :silent AsyncRun make test<CR>
nmap <silent> <Leader><Leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>
tmap <C-M-N> <C-\><C-N>
tmap <silent> <C-t> <C-\><C-N>:ToggleTerminalTop<CR>
vmap <Leader>s :sort

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                            « Coc Keymappings »                                    │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <C-j> <Plug>(coc-snippets-expand)
imap <C-k> <Plug>(coc-snippets-expand-jump)
nmap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-j> <Plug>(coc-diagnostic-next)
vmap <C-k> <Plug>(coc-snippets-select)
xmap <leader>x  <Plug>(coc-convert-snippet)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>at  <Plug>(coc-codeaction-selected)
nmap <leader>at  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qq  <Plug>(coc-fix-current)
nmap <Leader>cd :CocDiagnostics<CR>
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
nmap <silent> <C-c> <Plug>(coc-range-select)
xmap <silent> <C-c> <Plug>(coc-range-select)
nnoremap <silent> K :call <SID>show_documentation()<CR>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif " }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                                 « Others »                                        │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
nmap <Leader>bo :!source ~/.config/zsh/custom_func.zsh && blackout<CR><CR><C-l>
nmap <Leader>cbin :!source ~/.config/zsh/custom_func.zsh && change<CR><CR><C-l>
nmap <Leader>cbif :!source ~/.config/zsh/custom_func.zsh && change_f<CR><CR><C-l>

" inoremap \| \|<C-o>:call custom#AlignTable()<CR><C-o>$
" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
"
