set nocompatible
let g:polyglot_disabled = ['markdown']
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-obsession'
  Plug 'Yggdroot/indentLine'
  "Plug 'sainnhe/everforest'
  "Plug 'dhruvasagar/vim-table-mode' 
  "Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  "Plug 'glepnir/oceanic-material'
  Plug 'sheerun/vim-polyglot'
  Plug 'morhetz/gruvbox'
  "Plug 'nekonako/xresources-nvim'
  call plug#end()
let g:coc_global_extensions = ['coc-emmet', 'coc-prettier', 'coc-sh', 'coc-go', 'coc-clangd', 'coc-tsserver', 'coc-css', 'coc-tsserver']


"STATUSLINE
set statusline+=%1*\ \ \ [\ %{ObsessionStatus()}\ ]\ \ \ 
set statusline+=%1*\ \ \ \ \ \ [\ %f\ ]\ \ 
set statusline+=%=
set statusline+=%1*\ \ \ %y\ \ \ 
set statusline+=%1*\ \ \ [\ %l,%c\ ]\ \ \ 
set statusline+=%1*\ \ \ [\ %p%%\ ]\ \ \ 
"set statusline+=%\m 

augroup statusline
    autocmd!
    autocmd VimEnter,ColorScheme * hi User1 guifg=#C0B18B guibg=#151515
    autocmd VimEnter,ColorScheme * hi User2 guifg=#C0B18B guibg=#151515
augroup END


"FOLDING 
set foldnestmax=1
"au BufReadPre *.go setlocal foldmethod=syntax
au BufReadPre *.css setlocal foldmethod=syntax
"au BufReadPre *.js setlocal foldmethod=indent
"au BufReadPre *.sh setlocal foldmethod=indent

nnoremap <leader>fm :set foldmethod=manual<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>

"MISC
"set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20
nnoremap <leader>s :source ~/personal/userFiles/conf/nvim/init.vim<CR>
autocmd VimEnter * hi CursorLine ctermbg=blue  guibg=#262526
set cursorline




"set cursorcolumn
set shiftwidth=2
set mouse=a
set noswapfile 
set nu 
set relativenumber
au BufWinEnter * syntax on
set termguicolors


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

"TAB LINE
"set list lcs=tab:\.\ 


"COLORSCHEME

let g:gruvbox_contrast_dark='dark'
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
colorscheme gruvbox

set background=dark
let g:everforest_better_performance = 1

"lua require('init_')
