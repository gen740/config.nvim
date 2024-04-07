#!/bin/bash

set -e

NVIM_RUNTIME="$(nvim --headless -c 'echon $VIMRUNTIME' -c 'q' 2>&1)"

echo $NVIM_RUNTIME

# delete providers
rm -f "${NVIM_RUNTIME}/autoload/provider/perl.vim"
rm -f "${NVIM_RUNTIME}/autoload/provider/python3.vim"
rm -f "${NVIM_RUNTIME}/autoload/provider/ruby.vim"
rm -f "${NVIM_RUNTIME}/autoload/provider/script_host.rb"
rm -rf "${NVIM_RUNTIME}/lua/provider/node"
rm -rf "${NVIM_RUNTIME}/lua/provider/perl"
rm -rf "${NVIM_RUNTIME}/lua/provider/python"
rm -rf "${NVIM_RUNTIME}/lua/provider/ruby"

# delete zip plugins
rm -f "${NVIM_RUNTIME}/doc/pi_gzip.txt"
rm -f "${NVIM_RUNTIME}/plugin/gzip.vim"
rm -f "${NVIM_RUNTIME}/autoload/gzip.vim"

rm -f "${NVIM_RUNTIME}/doc/pi_zip.txt"
rm -f "${NVIM_RUNTIME}/plugin/zipPlugin.vim"
rm -f "${NVIM_RUNTIME}/autoload/zip.vim"

 rm -f "${NVIM_RUNTIME}/doc/pi_tar.txt"
 rm -f "${NVIM_RUNTIME}/plugin/tarPlugin.vim"
 rm -f "${NVIM_RUNTIME}/autoload/tar.vim"
 rm -f "${NVIM_RUNTIME}/syntax/tar.vim"

# delete matchit
rm -rf "${NVIM_RUNTIME}/pack/dist/opt/matchit"
rm -f "${NVIM_RUNTIME}/plugin/matchit.vim"
rm -f "${NVIM_RUNTIME}/macros/matchit.vim"

rm -f "${NVIM_RUNTIME}/plugin/matchparen.vim"

# delete tohtml
rm -f "${NVIM_RUNTIME}/plugin/tohtml.lua"
rm -f "${NVIM_RUNTIME}/lua/tohtml.lua"

# delete shada plugin
rm -f "${NVIM_RUNTIME}/ftplugin/shada.vim"
rm -f "${NVIM_RUNTIME}/autoload/shada.vim"
rm -f "${NVIM_RUNTIME}/plugin/shada.vim"
rm -f "${NVIM_RUNTIME}/syntax/shada.vim"

# delete editorconfig
rm -f "${NVIM_RUNTIME}/plugin/editorconfig.lua"
rm -f "${NVIM_RUNTIME}/syntax/editorconfig.vim"
rm -f "${NVIM_RUNTIME}/doc/editorconfig.txt"
rm -f "${NVIM_RUNTIME}/lua/editorconfig.lua"


rm -f "${NVIM_RUNTIME}/menu.vim"
rm -f "${NVIM_RUNTIME}/makemenu.vim"
rm -f "${NVIM_RUNTIME}/synmenu.vim"
rm -f "${NVIM_RUNTIME}/delmenu.vim"


rm -f "${NVIM_RUNTIME}/lua/vim/_defaults.lua"
rm -f "${NVIM_RUNTIME}/ftplugin/tutor.vim"
rm -f "${NVIM_RUNTIME}/autoload/tutor.vim"
rm -f "${NVIM_RUNTIME}/plugin/tutor.vim"
rm -f "${NVIM_RUNTIME}/syntax/tutor.vim"

rm -f "${NVIM_RUNTIME}/autoload/netrwFileHandlers.vim"
rm -f "${NVIM_RUNTIME}/autoload/netrw_gitignore.vim"
rm -f "${NVIM_RUNTIME}/autoload/netrwSettings.vim"
rm -f "${NVIM_RUNTIME}/plugin/netrwPlugin.vim"
rm -f "${NVIM_RUNTIME}/autoload/netrw.vim"
rm -f "${NVIM_RUNTIME}/syntax/netrw.vim"


# delete osc52
rm -f  "${NVIM_RUNTIME}/lua/vim/ui/clipboard/osc52.lua"
rm -f  "${NVIM_RUNTIME}/plugin/osc52.lua"
