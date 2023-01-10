#!/bin/bash
echo "Installing"
echo "Creating directory"
echo "Copying files"
cp -r nvim $HOME/.config/
nvim +PackerInstall
echo "Install Complete !!"
