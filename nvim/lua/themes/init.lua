local core = require('themes.colorschemes.nirvana')
local highlights = require('themes.highlights')

local function setup(opts)
	if opts == nil then
		opts = {}
	end
	local colors = core.get_colors()
	highlights.highlight_all(colors, opts)
end

setup({
	transparent_background = true
})
