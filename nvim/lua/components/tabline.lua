local cmd = vim.api.nvim_command
local fn = vim.fn

local tabline = function(glyphs, colors)
	cmd("hi TabLineSel gui=Bold guibg=" .. colors.color1 .. "guifg=" .. colors.color2)
	cmd("hi TabLineSelSeparator gui=bold guifg=#8ec07c")
	cmd("hi TabLine guibg=#504945 guifg=#b8b894 gui=None")
	cmd("hi TabLineSeparator guifg=#504945")
	cmd("hi TabLineFill guibg=None gui=None")

	local options = {
		show_index = true,
		show_modify = true,
		modify_indicator = "[+]",
		no_name = "[No Name]",
	}

	local s = ""
	for index = 1, fn.tabpagenr("$") do
		local winnr = fn.tabpagewinnr(index)
		local buflist = fn.tabpagebuflist(index)
		local bufnr = buflist[winnr]
		local bufname = fn.bufname(bufnr)
		local bufmodified = fn.getbufvar(bufnr, "&mod")

		s = s .. "%" .. index .. "T"
		if index == fn.tabpagenr() then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end
		-- tab index
		s = s .. " "
		-- index
		if options.show_index then
			s = s .. index .. ":"
		end
		-- buf name
		if bufname ~= "" then
			s = s .. "[" .. fn.fnamemodify(bufname, ":t") .. "] "
		else
			s = s .. options.no_name .. " "
		end
		-- modify indicator
		if bufmodified == 1 and options.show_modify and options.modify_indicator ~= nil then
			s = s .. options.modify_indicator .. " "
		end
	end

	s = s .. "%#TabLineFill#"

	local tl = s
	return tl
end
return tabline
