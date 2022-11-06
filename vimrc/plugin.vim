" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Custom Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ur4ltz/surround.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'airblade/vim-gitgutter'
Plug 'windwp/nvim-autopairs'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-ts-autotag'
"THEME
Plug 'olimorris/onedarkpro.nvim'
Plug 'Shatur/neovim-ayu'
Plug 'shaunsingh/nord.nvim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Initialize plugin system
call plug#end()
