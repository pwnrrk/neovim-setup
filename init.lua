local cmd = vim.cmd
cmd "set runtimepath+=~/.vim"
cmd "source ~/.vim/autoload/plug.vim"
cmd "source ~/.vim/vimrc/plugin.vim"
cmd "source ~/.vim/vimrc/coc.vim"
cmd "source ~/.vim/vimrc/mic.vim"
cmd "colorscheme catppuccin"
-- require('nord').set()
require('lualine').setup()
require('bufferline').setup()
require("nvim-tree").setup()
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true
  }
}
require('telescope').setup()
