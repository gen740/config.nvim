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
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                         « Python Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
let g:python_host_prog='~/.pyenv/versions/neovim-2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/neovim-3/bin/python' 

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « Vim Options »                                      │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
colo gruvbox
packadd! matchit                                " if endifみたいなのも括弧ジャンプができるようになる
let &colorcolumn="100" " .join(range(120,121),",") " 101列目に線を入れる
set conceallevel=1
set runtimepath+=~/.vim/custom_runtime
set autoread                                    " 編集中に別のところで編集されたら自動で読み込みます。
set autowrite                                   " normalモードに行くと勝手に保存してくれる
set backupext=.bak                              " バックアップファイルの拡張子
set clipboard=unnamed
set completeopt-=preview                        " プレビューウインドウを表示しない
set cursorline                                  " 今いる行をハイライト
set display=lastline                            " 最後の行をできるだけ表示する
set exrc
set guicursor=
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
set hidden                                      " 保存しなくてもバッファの切り替えができる
set ignorecase                                  " 大文字小文字を区別せずに検索してくれます。
set incsearch                                   " 文字検索時にリアルタイムで検索してくれます。
set iskeyword+=:                                " :をキーワードにする
set lazyredraw                                  " 出来るだけ再描画をしない
set list                                        " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set matchtime=5                                 " showmatchまでの時間
set mouse+=a                                    " マウスでカーソルの位置を指定できる
set modelines=10                                " modeline
set nobackup
set foldenable                                " 自動的に折り畳みをしない
set foldlevel=999
set nohlsearch                                  " 検索した文字がハイライトされます。
set noswapfile                                  " swapファイルは使いません
set nowritebackup  
set nu relativenumber                           " 番号を相対表示にする
set path+=**                                    " Vimのパスに親のパスを追加
set pumheight=12                                " 補完ウインドウの行数を決める
set scrolloff=8                                 " 余白を取るようになる
set shortmess+=c
set showcmd                                     " 入力中のコマンドを表示します。右下に表示されます。
set showmatch                                   " 対応する括弧を強調表示する
set signcolumn=yes                              " サイドにマーカー用の行を作成
set smartcase                                   " 大文字を入力したときにだけ大文字小文字を区別します
set splitbelow                                  " splitすると下に分かれる
set splitright                                  " splitすると右に分かれる
set tags=.tags;~                                " ctagsを遡って検索
set termguicolors                               " 色をバグらないようにする
set updatetime=300
set shada='1000,f1,<500,:500,@500,/500        " viminfoに蓄える内容とその量を決める
set whichwrap=b,s,<,>,[,]                       " 行末、行頭で行を跨ぐことができるようになります。
set wildmenu wildmode=longest,full              " 補完の形を決める（vim互換性）
if has('persistent_undo')                       " undoファイルをずっと残す
  set undodir=~/.vim/undo
  set undofile
endif

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « Abbreviations »                                    │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
iabbrev #b /**************************************************
iabbrev #e <Space>**************************************************/

"}}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                              « AutoCommands »                                     │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
autocmd BufEnter,FocusGained,InsertLeave * set cursorline
autocmd BufLeave,FocusLost,InsertEnter   * set nocursorline
autocmd ColorScheme * highlight Normal guibg=none
autocmd ColorScheme * highlight SignColumn guibg=none
autocmd ColorScheme * highlight EndOfBuffer guifg=#222222
autocmd BufRead,BufNewFile *.[ch] nmap <silent><buffer> <Leader>f :silent CFamilyFMT<CR>
autocmd BufRead,BufNewFile *.[chi]pp nmap <buffer> <Leader>f :silent CFamilyFMT<CR>
autocmd FileType python nmap <buffer> <Leader>f :silen PEPFMT<CR>
autocmd BufRead,BufNewFile *.rlib nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.rs nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.tex nmap <Leader>r <Leader>ll<Leader>lv
autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
autocmd BufRead,BufNewFile *.wiki setlocal filetype=tex
autocmd BufRead,BufNewFile *.tex nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd BufRead,BufNewFile *.tex vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd TermOpen * setlocal nonumber norelativenumber
" autocmd BufRead,BufNewFile *.cpp syntax match Entity "main" conceal cchar=

" }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                         « Indent Configurations »                                 │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
set autoindent                  " 改行したりした時にインデントを保持してくれます。
set expandtab                   " タブを押すと空白が挿入されるようにする
set nowrap                      " 折り返しをしない
set shiftwidth=4                " vimのインデントでいくつ空白を挿入するか
set softtabstop=4               " tabを押した時に空白何個分のインデントをとるか。
set tabstop=4                   " 一個のタブを空白何個分にとるか。
augroup fileTypeIndent
  autocmd!
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType markdown setlocal filetype=markdown
  autocmd FileType markdown nnoremap o A<CR>
  autocmd FileType qf setlocal wrap
  autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType rust let g:rust_recommended_style = 1
  autocmd FileType rust let g:rustfmt_autosave = 1
  autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END  " }}}
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
" │ {{{                               « Treesitter »                                      │
" ┼───────────────────────────────────────────────────────────────────────────────────────┼
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  -- disable = { "c", "cpp", "python"},
  },
  incremental_selection = {
    enable = true              -- false will disable the whole extension
  },
  textobjects = {
    select = {
    enable = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      -- Or you can define your own textobjects like this
      ["iF"] = {
        python = "(function_definition) @function",
        cpp = "(function_definition) @function",
        c = "(function_definition) @function",
        java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sP"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    -- smart_rename = {
     -- enable = false,
     -- keymaps = {
       -- smart_rename = "grr",
     -- },
   -- },
  },
}
EOF

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
  " autocmd BufWinEnter * silent! loadview
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
inoremap <silent> <C-[> <C-[>:silent ChangeIME<CR>
inoremap <silent> <esc> <esc>:silent ChangeIME<CR>
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <silent> <C-n> <Plug>AirlineSelectNextTab
nmap <silent> <C-p> <Plug>AirlineSelectPrevTab
nmap <silent> <C-q> :Fern . -reveal=%<CR>
nmap <silent> <Leader>aa :Git add --all<CR>
nmap <silent> <Leader>am :silent Git commit<CR>
nmap <silent> <Leader>ap :Git push origin HEAD<CR>
nmap <silent> <Leader>bl :BLines!<CR>
nmap <silent> <Leader>cN :cp<CR>
nmap <silent> <Leader>ccc :resize 50<CR>
nmap <silent> <Leader>cn :cn<CR>
nmap <silent> <Leader>co :e ~/.config/nvim/init.vim<CR>
nmap <silent> <Leader>df :FzfPreviewDirectoryFiles<CR>
nmap <silent> <Leader>gb :FzfPreviewGitBranches<CR>
nmap <silent> <Leader>gf :FzfPreviewGitFiles<CR>
nmap <silent> <Leader>gs :FzfPreviewGitStatus<CR>
nmap <silent> <Leader>gaf :FzfPreviewAllBuffers<CR>
nmap <silent> <Leader>qf :copen<CR>
nmap <silent> <Leader>rf :set foldmethod=expr<CR>
nmap <silent> <Leader>sw :SetWin<CR>
nmap <silent> <Leader>ta :TagbarToggle<CR>
nmap <silent> <Leader>tt :ToggleTerminalTop<CR>
nmap <silent> <Leader>tb :ToggleTerminalBottom<CR>
nmap <silent> <Leader>tp :!open /Applications/Typora.app %<CR><CR>
nmap <silent> <Leader>ut :UndotreeToggle<CR>
nmap <silent> <Leader>vq :vertical copen<CR>:vertical resize 80<CR>:wincmd h<CR>
nmap <silent> <Leader>? :vertical split<CR>:view ~/.config/nvim/keymap.md<CR>:setlocal nomodifiable<CR>
nnoremap <Leader>lsy :hi Conceal guifg=#dddddd<CR>
nnoremap <Leader>lsn :hi Conceal guifg=#555555<CR> 
nnoremap <silent> <Left> :vertical resize -2<CR>
nnoremap <silent> <Right> :vertical resize +2<CR>
nnoremap <silent> <Down> :resize +2<CR>
nnoremap <silent> <Up> :resize -2<CR>
noremap <Leader>r :w<CR><C-w>ji<C-p><C-m><C-\><C-n><C-w>k
nmap <silent> <Leader><Leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>
tmap <C-M-N> <C-\><C-N>
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
imap <C-k> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
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
