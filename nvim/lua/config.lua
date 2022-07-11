--Components

local has_tabline, _tabline = pcall(require, "./components/tabline")
local has_statusline, _ = pcall(require, "./components/stasdatusline")

local glyphs = {"","","",""}
local colors = {
  color1="#5C6652", --Main
  color2="#111A1F", --Secondary
  color3="#0F0E0D", --Text
  color4="#8C4F4A",
  color5="#111A1F", --None|Bacground
  color6="#111A1F", --Extra#1
  color7="#111A1F", --Extra#2
}

if not has_tabline  then
  print("skipping_tabline_component")
elseif has_tabline then
  --vim.opt.tabline =_tabline(glyphs,colors)
end

if not has_statusline then
  print("skipping_statusline_component")
end


