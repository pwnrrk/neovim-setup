#!bin/bash
mkdir -p $HOME/.vim && cp ./autoload $HOME/.vim/ -r
cp ./vimrc $HOME/.vim/ -r
cp ./init.vim $HOME/.config/nvim
echo "Config Installed"
