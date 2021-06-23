"===================================================================================================
" Deinの設定
"===================================================================================================
"dein Scripts-----------------------------
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
"　必要なときにコメントアウトを戻してpluginを削除してください。
" call map(dein#check_clean(), "delete(v:val, 'rf')")
" call dein#recache_runtimepath()
