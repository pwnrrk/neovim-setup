echo "Installing"
echo "Creating directory"
mkdir ~/AppData/Local/nvim
echo "Copying files"
cp ./win-init.vim ~/AppData/Local/nvim/init.vim
cp ./coc-settings.json ~/AppData/Local/nvim
cp ./autoload ~/AppData/Local/nvim -r
cp ./vimrc ~/AppData/Local/nvim -r
nvim +PlugInstall
echo "Install Complete !!"
