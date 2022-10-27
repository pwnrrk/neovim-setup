" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Custom Plugin
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"THEME
Plug 'olimorris/onedarkpro.nvim'
Plug 'Shatur/neovim-ayu'
Plug 'shaunsingh/nord.nvim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Initialize plugin system
call plug#end()
