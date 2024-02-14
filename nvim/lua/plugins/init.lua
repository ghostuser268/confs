vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { 'tpope/vim-surround' }
	use { 'jiangmiao/auto-pairs' }
	use { 'preservim/nerdcommenter' }
	use { 'ayu-theme/ayu-vim' }

	use { "rebelot/kanagawa.nvim" }
	use { 'sainnhe/gruvbox-material' }
	use { "akinsho/horizon.nvim", tag = "*",
		config = "require('plugins.confs.horizon')"
	}
	--use({
	--"neanias/everforest-nvim",
	---- Optional; default configuration will be used if setup isn't called.
	--config = function()
	--require("everforest").setup()
	--end,
	--})
	use { "lukas-reineke/indent-blankline.nvim",
		config = "require('plugins.confs.indentlines')",
	}
	use "nvim-lua/plenary.nvim"
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = "require('plugins.confs.telescope')"
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run =
	'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use {
		'LukasPietzschmann/telescope-tabs',
		requires = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require 'telescope-tabs'.setup {
				show_preview = true,
				-- Your custom config :^)
			}
		end
	}
	use { 'neoclide/coc.nvim', branch = 'release' }
	use {
		"nvim-tree/nvim-web-devicons",
		event = "BufWinEnter",
		config = "require('plugins.confs.devicons')",
		module = "nvim-web-devicons"
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = "require('plugins.confs.lualine')"

	}
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		event = "UIEnter",
		branch = "dev",
		config = "require('plugins.confs.bufferline')"
	}
	use "tiagovla/scope.nvim"
	use {
		'kyazdani42/nvim-tree.lua',
		cmd = "NvimTreeToggle",
		config = "require('plugins.confs.nvim-tree')"
	}
	use {
		"akinsho/toggleterm.nvim",
		config = "require('plugins.confs.toggleterm')",
		event = "BufWinEnter"
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = "require('plugins.confs.colorizer')",
		event = { "UIEnter" }
	}
	use {
		'lewis6991/impatient.nvim'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		module = "nvim-treesitter",
		event = "BufRead",
		config = "require('plugins.confs.treesitter')"
	}
end)
