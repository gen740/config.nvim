# Dependancies
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake
sudo apt-get install -y cmake g++ pkg-config unzip curl doxygen

git clone https://github.com/neovim/neovim ~/.local/tools/neovim
cd ~/.local/tools/neovim && make -j4 && sudo make install
