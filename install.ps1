echo "Installing"
echo "Creating directory"
mkdir ~/AppData/Local/nvim
mkdir ~/.vim
echo "Copying files"
cp -force ./init.lua ~/AppData/Local/nvim
cp -force ./coc-settings.json ~/AppData/Local/nvim
cp -force -r ./autoload ~/.vim/
cp -force -r ./vimrc ~/.vim/
nvim +PlugInstall
echo "Install Complete !!"
