require("nvim-treesitter")

vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = { "c", "lua", "rust", "bash", "json", "json5", "javascript", "html", "css" },
	sync_install = false,
	auto_install = true,


	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = {},
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		additional_vim_regex_highlighting = false,
	},
}
