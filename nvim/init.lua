vim.defer_fn(function() pcall(require, "impatient") end, 0)
local set = vim.opt
local cmd = vim.cmd
local g = vim.g
local api = vim.api
local map = vim.keymap.set
local opt = vim.opt
---------------------------------DEFAULT OPTIONS
set.shiftwidth = 3
set.conceallevel = 0
set.hidden = true
set.autoindent = true
set.ruler = false
set.showtabline = 2

			set.mouse = "a"
set.swapfile = false

set.number = true
set.relativenumber = true
set.numberwidth = 3
set.shadafile = "NONE"
set.tabstop = 2
set.shadafile = ""

opt.termguicolors = true
vim.o.pumheight = 10 -- Max items to show in pop up menu
vim.o.cmdheight = 1  -- Max items to show in command menu
cmd('set lazyredraw')

--Folding
set.foldnestmax = 2
set.foldmethod = "expr"
cmd("set nofoldenable")
----------------------------------------
---------------------------------KEYMAPS
g.apleader = " "
map('n', '<A-left>', '<C-w>h', { noremap = true, silent = false })
map('n', '<A-right>', '<C-w>l', { noremap = true, silent = false })
map('n', '<A-down>', '<C-w>j', { noremap = true, silent = false })
map('n', '<A-up>', '<C-w>k', { noremap = true, silent = false })
map('n', '<leader>s', ':source ~/personal/confs/nvim/init.lua<CR>',
	{ noremap = true })
map('n', '<C-Left>', ':tabprevious<CR>', { noremap = true })
map('n', '<C-Right>', ':tabnext<CR>', { noremap = true })
map('v', '<C-c>', '"+y', { noremap = true })

map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true })

map("i", "<C-c>", "<Esc>", { noremap = false })

map("n", "<C-z>", ":q!<CR>", { noremap = true })
map('n', '<C-c>', ':w!<CR>', { noremap = true })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- PLUGIN KEYMAPS
map('n', '<C-m>', ':Mason<CR>', { noremap = true, silent = false })
map('n', '<leader>ft', ':lua require("telescope-tabs").list_tabs()<CR>', { noremap = true, silent = false })

---------------------------------PLUGINS
require("plugins")
require("scope").setup()

---------------------------------BORDER
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=none ]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=none guibg=none]]

---------------------------------COLORSCHEME
set.background = "dark"
vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_better_performance = 1")

vim.cmd("colorscheme paper")
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=none ]]
