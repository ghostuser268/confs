vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	--MASON + LSP + Completion + Formmatter
	use { "williamboman/mason.nvim", config = "require('plugins.confs.mason')" }
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use { "hrsh7th/nvim-cmp", config = "require('plugins.confs.cmp')" }

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({

				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					sh = { "shellharden", "beautysh $FILENAME" },
				},
			})
		end,
	})


	--FUNCTIONALITY
	use { "lukas-reineke/indent-blankline.nvim",
		config = "require('plugins.confs.indentlines')",
	}

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
			}
		end
	}

	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		event = "UIEnter",
		branch = "dev",
		config = "require('plugins.confs.bufferline')"
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
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		module = "nvim-treesitter",
		event = "BufRead",
		config = "require('plugins.confs.treesitter')"
	}

	use 'preservim/nerdcommenter'
	use "nvim-lua/plenary.nvim"
	use "tiagovla/scope.nvim"
	use 'lewis6991/impatient.nvim'
	use 'tpope/vim-surround'
	use 'jiangmiao/auto-pairs'

	--DESIGN
	use {
		'nvim-lualine/lualine.nvim',
		config = "require('plugins.confs.lualine')"

	}

	--COLORSCHEMES
	use { 'Everblush/nvim', as = 'everblush' }
	use 'ayu-theme/ayu-vim'
	use 'sainnhe/gruvbox-material'
	use "sainnhe/everforest"
	use "nanotech/jellybeans.vim"
	use "nyoom-engineering/oxocarbon.nvim"
	use "marko-cerovac/material.nvim"
	use 'AlexvZyl/nordic.nvim'
end)
