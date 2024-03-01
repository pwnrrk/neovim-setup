local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

ensure_packer()

local packer = require('packer')

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'Tsuzat/NeoSolarized.nvim'
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
	use 'numToStr/Comment.nvim'
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}
	use {
		"kylechui/nvim-surround",
		tag = "*",
	}
	use {
		'nvim-treesitter/nvim-treesitter-context'
	}
	use {
		'yamatsum/nvim-cursorline'
	}
end)

