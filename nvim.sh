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

sudo apt install xclip

#  install nerdfont
#

mkdir -p ~/Downloads/tmp
cd ~/Downloads/tmp

# install build dep
sudo apt-get install ninja-build gettext cmake curl build-essential

#Build
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=~/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo
make install

# add my config
#

cd ..
git clone https://github.com/ParadoxPD/neovim-config.git

rm -rf ~/.config/nvim
mkdir -p ~/.config/

mv neovim-config nvim
mv ~/Downloads/tmp/nvim/ ~/.config/

export PATH="$HOME/neovim/bin:$PATH"

echo "INSTALL SUCCESSFUL\n MAKE SURE TO ADD ~/neovim/bin to PATH"

rm -rf ~/Downloads/tmp
rm nvim.sh
