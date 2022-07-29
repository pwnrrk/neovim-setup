local cmd = vim.cmd
cmd "set runtimepath+=~/.vim"
cmd "source ~/.vim/autoload/plug.vim"
cmd "source ~/.vim/vimrc/plugin.vim"
cmd "source ~/.vim/vimrc/coc.vim"
cmd "source ~/.vim/vimrc/mic.vim"
cmd "colorscheme catppuccin"
cmd "hi Normal guibg=NONE ctermbg=NONE"
cmd "hi clear LineNr"
cmd "hi clear SignColumn"
-- require('nord').set()
require('lualine').setup()
require('bufferline').setup()
require("nvim-tree").setup{
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true
  }
}
require('telescope').setup()
require('nvim-ts-autotag').setup()
