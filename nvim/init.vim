call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-obsession'
  Plug 'Yggdroot/indentLine'
  Plug 'preservim/tagbar'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'rust-lang/rust.vim'
  Plug 'wesleimp/stylua.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'morhetz/gruvbox'
  Plug 'maxmellon/vim-jsx-pretty'
call plug#end()
 
filetype plugin indent on
set foldnestmax=1


let g:coc_global_extensions = ['coc-lua', 'coc-emmet', 'coc-prettier', 'coc-sh', 'coc-go', 'coc-clangd', 'coc-tsserver', 'coc-css', 'coc-tsserver', 'coc-rls', 'coc-json']
"FOLDING 
au BufReadPre *.css setlocal foldmethod=syntax


nnoremap <leader>fm :set foldmethod=manual<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>

"MISC
nnoremap <leader>s :source ~/confs/nvim/init.vim<CR>
autocmd VimEnter * hi CursorLine ctermbg=blue  guibg=#262526
set cursorline



let g:rust_cargo_check_all_features = 1
"RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"au VimEnter * RainbowParentheses
"CTAGS *needs ctags*
nmap <leader>tt :TagbarToggle<CR>

"set cursorcolumn
set shiftwidth=2
set mouse=a
set noswapfile 
set nu 
set relativenumber
au BufWinEnter * syntax on
set termguicolors
set showtabline=2
set noshowmode
set noruler
set laststatus=0
set noshowcmd

"COPY
vmap <C-c> "+y

"FUNCTIONS 
function! QuickSave()
	:w!
endfunction
nnoremap <c-c> :call QuickSave()<CR>

function! CleanExit()
	:q!
      endfunction
nnoremap <c-z> :call CleanExit()<CR>

function! SpawnTerminal()
  set splitbelow
  split term://bash
  resize 8
endfunction
nnoremap <c-n> :call SpawnTerminal()<CR>


"FZF 
nnoremap <C-p> :FZF<CR>
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']


"" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-left> <C-w>h
nnoremap <A-down> <C-w>j
nnoremap <A-up> <C-w>k
nnoremap <A-right> <C-w>l
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"PRETTIER
command! -nargs=0 Prettier :CocCommand prettier.formatFile


"COC
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



"COLORSCHEME
"colorscheme base-16

colorscheme gruvbox
highlight Normal ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE




function TabLine()
  hi ts_bg1 guibg=#68A8E4  guifg=#1C1B19 
  hi ts_fg1 guibg=#1C1B19  guifg=#68A8E4
  hi ts_bg2 guibg=#BC9D66  guifg=#1C1B19
  hi ts_fg2 guibg=#1C1B19  guifg=#BC9D66
  let s=''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
    ""Selected
      let s ..= '%#ts_bg1#'
      let s ..= ' %a' .. (i + 1) .. '  '.ObsessionStatus().' '
      let s ..= '%{Label(' .. (i + 1) .. ')} '.'%#ts_fg1#' 
    else
      let s ..= '%#ts_bg2# %{Label(' .. (i + 1) .. ')} '.'%#ts_fg2#' 
    endif
  endfor
  let s ..= '%#Normal#%=' "Fill
  if tabpagenr('$') > 1
    let s ..= '%=%999X%#ts_bg1# [ x ] '

  endif
  return s
endfunction

function Label(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction
set tabline=%!TabLine()


"lua require('config')

