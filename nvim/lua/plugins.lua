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

local packer_bootstrap = ensure_packer()

local packer = require('packer')

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
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
	use 'yamatsum/nvim-cursorline'
	use 'lambdalisue/glyph-palette.vim'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-sensible'
	use 'tpope/vim-fugitive'

end)

