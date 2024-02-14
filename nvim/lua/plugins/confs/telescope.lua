local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "!**/node_modules/*")





require('telescope').setup {
	extensions = {
		fzf = {
			fuzzy = true,             -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},

	defaults = {
		--vimgrep_arguments =
		--function(filepath, bufnr, opts)
		--opts = opts or {}

		--filepath = vim.fn.expand(filepath)


		--Job:new({
		--command = "file",
		--args = { "--mime-type", "-b", filepath },
		--on_exit = function(j)
		--local mime_type = vim.split(j:result()[1], "/")[1]
		--if mime_type == "text" then
		--previewers.buffer_previewer_maker(filepath, bufnr, opts)
		--else
		---- maybe we want to write something to the buffer here
		--vim.schedule(function()
		--vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
		--end)
		--end
		--end
		--}):sync()

		--vim.loop.fs_stat(filepath, function(_, stat)
		--if not stat then return end
		--if stat.size > 1000000 then
		--return
		--else
		--previewers.buffer_previewer_maker(filepath, bufnr, opts)
		--end
		--end)
		--end,
		--buffer_previewer_maker = new_maker,
		layout_config = {
			vertical = { width = 0.9 }
		},

	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" },
			theme = "dropdown",
		}
	},

}

require('telescope').load_extension('fzf')
