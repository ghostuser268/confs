vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use { "stevearc/dressing.nvim" }
	--MASON
	use {
		"williamboman/mason.nvim",
		config = "require('plugins.confs.mason')"
	}
	use {
		"williamboman/mason-lspconfig.nvim",
	}
	use {
		"neovim/nvim-lspconfig",
	}

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use {
		"hrsh7th/nvim-cmp",
		config = "require('plugins.confs.cmp')"

	}
	use 'AlexvZyl/nordic.nvim'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({

				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					sh = { "shellharden", "beautysh $FILENAME" },
				},
			})
		end,
	})

	use { 'tpope/vim-surround' }
	use { 'jiangmiao/auto-pairs' }
	use { 'preservim/nerdcommenter' }
	use { 'ayu-theme/ayu-vim' }
	use { 'sainnhe/gruvbox-material' }
	use "nanotech/jellybeans.vim"
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
	use "nyoom-engineering/oxocarbon.nvim"
	use "marko-cerovac/material.nvim"
	use {
		'nvim-lualine/lualine.nvim',
		--requires = { 'nvim-tree/nvim-web-devicons', opt = true },
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
