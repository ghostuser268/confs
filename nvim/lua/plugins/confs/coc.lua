--require("coc")

local opts = { silent = true, nowait = true, expr = true }
local opts2 = { silent = true, noremap = true, expr = true, replace_keycodes = false }
api.nvim_create_user_command("Format", "call CocAction('format')", {})
api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
cmd(
	"let g:coc_global_extensions = ['coc-clangd' ,'coc-json', 'coc-sh', 'coc-rust-analyzer', 'coc-sumneko-lua', 'coc-tsserver', 'coc-css', 'coc-emmet', 'coc-html']")
map("n", "<leader>tt", "<Plug>(coc-format-selected)", { silent = true })
map("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts2)
map("i", "<C-b>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
map("i", "<C-f>",
	'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

map("n", "<leader>tt", "coc#rpc#kill()", opts2)
