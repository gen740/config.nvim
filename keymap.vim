"===================================================================================================
" キーマッピングを設定します。
"===================================================================================================
let mapleader = "\<Space>"                       " LeaderキーをSpaceに
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-l>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"===================================================================================================
" Keymapping
"===================================================================================================
inoremap <silent> <C-[> <C-[>:silent ChangeIME<CR>
inoremap <silent> <esc> <esc>:silent ChangeIME<CR>
nmap <C-n> <Plug>AirlineSelectNextTab
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-q> :Fern %:h -drawer -toggle<CR>
nmap <Leader>ar :w<CR><C-w>jiAtCodeCheck<C-m><C-\><C-n><C-w>k
nmap <Leader>at :call custom#AlignTable()<CR>
nmap <Leader>bb :Bookmark
nmap <Leader>bl :BLines!<CR>
nmap <Leader>vq :vertical copen<CR>:vertical resize 80<CR>:wincmd h<CR>
nmap <Leader>qf :copen<CR>
nmap <Leader>cn :cn<CR>
nmap <Leader>cN :cp<CR>
nmap <Leader>cca :e ~/.vim/custom_runtime/autoload/custom.vim<CR>
nmap <Leader>ccp :e ~/.vim/custom_runtime/plugin/custom.vim<CR>
nmap <Leader>ccc :resize 50<CR>
nmap <Leader>cl :e ~/.vim/dein/lazy_plugins.toml<CR>
nmap <Leader>co :e ~/.config/nvim/init.vim<CR>
nmap <Leader>cp :e ~/.vim/dein/plugins.toml<CR>
nmap <Leader>cr :so ~/.config/nvim/init.vim<CR>
nmap <Leader>gad :Git ada<CR>
nmap <Leader>gco :silent Git commit<CR>
nmap <Leader>gph :Git push origin HEAD<CR>
nmap <Leader>gb :FzfPreviewGitBranches<CR>
nmap <Leader>gf :FzfPreviewGitFiles<CR>
nmap <Leader>gs :FzfPreviewGitStatus<CR>
nmap <Leader>df :FzfPreviewDirectoryFiles
nmap <Leader>h :wincmd h<CR>
nmap <Leader>j :wincmd j<CR>
nmap <Leader>k :wincmd k<CR>
nmap <Leader>l :wincmd l<CR>
nmap <Leader>rs :resize
nmap <Leader>sw :SetWin<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>ut :UndotreeToggle<CR>
nmap <Leader>vr :vertical resize
nmap <Leader>zfab :FzfPreviewAllBuffers<CR>
nmap <silent> <Leader><Leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
noremap <Leader>r :w<CR><C-w>ji<C-p><C-m><C-\><C-n><C-w>k
tmap <C-M-N> <C-\><C-N>
vmap <Leader>s :sort

"===================================================================================================
" Coc
"===================================================================================================
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <C-k> <Plug>(coc-snippets-expand)
vmap <C-k> <Plug>(coc-snippets-select)
xmap <leader>x  <Plug>(coc-convert-snippet)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-j> <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qq  <Plug>(coc-fix-current)
nmap <Leader>cd :CocDiagnostics<CR>
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
nnoremap <silent> K :call <SID>show_documentation()<CR>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

"===================================================================================================
" Tabular
"===================================================================================================
" inoremap \| \|<C-o>:call custom#AlignTable()<CR><C-o>$

"===================================================================================================
" Background
"===================================================================================================
nmap <Leader>bo :!source ~/.config/zsh/custom_func.zsh && blackout<CR><CR><C-l>
nmap <Leader>cbin :!source ~/.config/zsh/custom_func.zsh && change<CR><CR><C-l>
nmap <Leader>cbif :!source ~/.config/zsh/custom_func.zsh && change_f<CR><CR><C-l>

