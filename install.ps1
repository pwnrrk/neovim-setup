echo "Installing"
echo "Creating directory"
mkdir ~/AppData/Local/nvim
mkdir ~/.vim
echo "Copying files"
cp ./init.lua ~/AppData/Local/nvim
cp ./coc-settings.json ~/AppData/Local/nvim
cp ./autoload ~/.vim/ -r
cp ./vimrc ~/.vim/ -r
nvim +PlugInstall
echo "Install Complete !!"
