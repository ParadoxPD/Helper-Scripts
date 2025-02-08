#!/bin/bash

set -euo pipefail

#install neovim

#update apt

sudo apt update && sudo apt upgrade -y

## install dependencies for neovim stuff

# gcc git make unzip

sudo apt install gcc git make unzip

# ripgrep

sudo apt install ripgrep

# clipboard
#

sudo apt instal xclip

#  install nerdfont
#

mkdir -p ~/Downloads/tmp

cd ~/Downloads/tmp

# install build dep

sudo apt-get install ninja-build gettext cmake curl build-essential

git clone https://github.com/neovim/neovim

# build
#
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "add /usr/local/nvim to PATH"

# add my config
#

cd ..

git clone https://github.com/ParadoxPD/neovim-config.git

rm -rf ~/.config/nvim

mkdir -p ~/.config/nvim
mv -v ~/Downloads/tmp/neovim-config/.[!.]* ~/.config/nvim/
