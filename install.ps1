echo "Installing"
echo "Creating directory"
echo "Copying files"
cp -r -force nvim $HOME/AppData/Local
nvim +PackerInstall
echo "Install Complete !!"
