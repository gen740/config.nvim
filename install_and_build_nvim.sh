# Dependancies
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

git clone https://github.com/neovim/neovim ~/.local/tools/neovim
cd ~/.local/tools/neovim && make -j4 && sudo make install
