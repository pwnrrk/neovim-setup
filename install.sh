#!/bin/bash
echo "Installing"
echo "Creating directory"
mkdir $HOME/.config/nvim
mkdir $HOME/.vim
echo "Copying files"
cp ./init.lua $HOME/.config/nvim
cp ./coc-settings.json $HOME/.config/nvim
cp ./autoload $HOME/.vim/ -r
cp ./vimrc $HOME/.vim/ -r
nvim +PlugInstall
echo "Install Complete !!"
