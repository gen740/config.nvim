let g:EasyMotion_keys               = get(g:,
    \ 'EasyMotion_keys', 'aoeidtnpyfgcrl;qjkxbmwvzuhs')
   "\ 'EasyMotion_keys', 'asdghklqwertyuiopzxcvbnmfj;')
let g:EasyMotion_use_migemo = 1

let g:previm_open_cmd = "open -a Safari"

let g:gitgutter_map_keys=0
let g:gitgutter_realtime = 1
"let g:gitgutter_eager = 0

let g:indentLine_color_gui = "#555555"

autocmd FileType tex let g:indentLine_color_gui = "#dddddd"
autocmd BufNewFile,BufRead *.tex hi Statement guifg=#dddddd
" let g:indentLine_char = '┊'
let g:indentLine_char = '│'
let g:indentLine_conceallevel=1
let g:indentLine_concealcursor=""
set conceallevel=1
set concealcursor-=incv
autocmd FileType tex let g:indentLine_enabled=0

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z'] ]
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#close_symbol = 'X'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter ='default'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_detect_modified=1
let g:airline_left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_stl_path_style = 'short'
let g:airline_theme = 'minimalist' "''gruvbox'  ubaryd, understated violet solalized
set laststatus=2                " 下のステータスライン
set noshowmode                  " デフォルトのステータスラインを消す
set showtabline=2
set statusline=2                " ステータスラインの記述

let g:fern#renderer = "nerdfont"
autocmd Filetype fern setlocal nonu norelativenumber
function! s:init_fern() abort
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
endfunction
augroup my-fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,
  \ 'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_preview_default_fzf_options = { '--reverse': v:true, '--preview-window': 'wrap' }
" let g:fzf_preview_direct_window_option = ''
" let g:fzf_preview_floating_window_rate = 0.95
let g:fzf_preview_if_binary_command = '[ [ "$(file --mime {})" =~ binary ] ]'
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'
let g:fzf_preview_buffers_jump = 1
let g:fzf_preview_cache_directory = expand('~/.cache/vim/fzf_preview')
let g:fzf_preview_command = 'bat --color=always --theme=gruvbox-dark --plain {-1}'
let g:fzf_preview_dev_icon_prefix_string_length = 3
let g:fzf_preview_dev_icons_limit = 5000
let g:fzf_preview_directory_files_command = 'fd --hidden --follow --exclude .git'
let g:fzf_preview_fzf_color_option = 'border:#aaaaaa,pointer:#ffffff,bg+:#006400'
let g:fzf_preview_git_files_command = 'git ls-files --exclude-standard'
let g:fzf_preview_git_status_command = 'git -c color.status=always status --short --untracked-files=all'
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'
let g:fzf_preview_grep_preview_cmd = expand('<sfile>:h:h') . '/bin/preview_fzf_grep'
let g:fzf_preview_lines_command = 'bat --color=always --theme=gruvbox-dark --plain --number' " Installed bat
let g:fzf_preview_mru_limit = 1000
let g:fzf_preview_quit_map = 1
let g:fzf_preview_use_dev_icons = 1

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

let g:vimspector_enable_mappings = 'HUMAN'

let g:colorizer_nomap=1


let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
set conceallevel=1
let g:vim_markdown_math = 1

let g:Tex_SmartKeyBS = 0
let g:Tex_SmartKeyQuote = 0
let g:Tex_SmartKeyDot = 0
let g:Imap_UsePlaceHolders = 0
let g:Tex_CompileRule_pdf = 'lualatex $* > /dev/null'
let g:Tex_CompileRule_dvi = 'lualatex $* > /dev/null'
