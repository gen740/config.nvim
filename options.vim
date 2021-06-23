"===================================================================================================
" Python Configuration
"===================================================================================================
let g:python_host_prog='~/.pyenv/versions/neovim-2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/neovim-3/bin/python'


"===================================================================================================
" Options
"===================================================================================================
colo gruvbox
packadd! matchit                                " if endifみたいなのも括弧ジャンプができるようになる
let &colorcolumn="101" " .join(range(101,101),",") " 101列目に線を入れる
set conceallevel=1
set runtimepath+=~/.vim/custom_runtime
set autoread                                    " 編集中に別のところで編集されたら自動で読み込みます。
set autowrite                                   " normalモードに行くと勝手に保存してくれる
set backupext=.bak                              " バックアップファイルの拡張子
set clipboard=unnamed
set completeopt-=preview                        " プレビューウインドウを表示しない
set cursorline                                  " 今いる行をハイライト
set display=lastline                            " 最後の行をできるだけ表示する
set foldexpr=nvim_treesitter#foldexpr()
set foldmethod=expr
set hidden                                      " 保存しなくてもバッファの切り替えができる
set ignorecase                                  " 大文字小文字を区別せずに検索してくれます。
set incsearch                                   " 文字検索時にリアルタイムで検索してくれます。
set iskeyword+=:                                " :をキーワードにする
set lazyredraw                                  " 出来るだけ再描画をしない
set matchtime=5                                 " showmatchまでの時間
set mouse+=a                                    " マウスでカーソルの位置を指定できる
set nobackup
set nofoldenable                                " 自動的に折り畳みをしない
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
set viminfo='1000,f1,<500,:500,@500,/500        " viminfoに蓄える内容とその量を決める
set whichwrap=b,s,<,>,[,]                       " 行末、行頭で行を跨ぐことができるようになります。
set wildmenu wildmode=longest,full              " 補完の形を決める（vim互換性）

if has('persistent_undo')                       " undoファイルをずっと残す
  set undodir=~/.vim/undo
  set undofile
endif

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

"===================================================================================================
" Indent
"===================================================================================================
set autoindent                  " 改行したりした時にインデントを保持してくれます。
set expandtab                   " タブを押すと空白が挿入されるようにする
set nowrap                      " 折り返しをしない
set shiftwidth=2                " vimのインデントでいくつ空白を挿入するか
set softtabstop=2               " tabを押した時に空白何個分のインデントをとるか。
set tabstop=2                   " 一個のタブを空白何個分にとるか。
augroup fileTypeIndent
  autocmd!
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType markdown setlocal filetype=markdown
  autocmd FileType markdown nnoremap o A<CR>
  autocmd FileType qf setlocal wrap
  autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType rust let g:rust_recommended_style = 1
  autocmd FileType rust let g:rustfmt_autosave = 1
  autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
  " autocmd FileType c setlocal foldmarker={,}
  " autocmd FileType cpp setlocal foldmarker={,}
  " autocmd FileType cpp setlocal foldmarker={,}
augroup END

"===================================================================================================
" Tree sitter
"===================================================================================================
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
  }
}
EOF

" Load KeyMapping
