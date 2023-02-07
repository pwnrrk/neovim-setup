vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'svrana/neosolarized.nvim'
	use 'tjdevries/colorbuddy.vim'
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'nvim-treesitter/nvim-treesitter'
	use 'lewis6991/gitsigns.nvim'
	use 'akinsho/bufferline.nvim'
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
	use 'windwp/nvim-ts-autotag'
	use 'yamatsum/nvim-cursorline'
	use 'lambdalisue/glyph-palette.vim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-sensible'
	use 'tpope/vim-fugitive'
	use 'APZelos/blamer.nvim'


	if install_plugins then
		packer.sync()
	end
end)

if install_plugins then
	return
end

