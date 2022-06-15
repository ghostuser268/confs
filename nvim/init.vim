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
  Plug 'arcticicestudio/nord-vim'
  Plug 'preservim/tagbar'
  Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/rainbow_parentheses.vim'
  "Plug 'nekonako/xresources-nvim'
  call plug#end()
let g:coc_global_extensions = ['coc-emmet', 'coc-prettier', 'coc-sh', 'coc-go', 'coc-clangd', 'coc-tsserver', 'coc-css', 'coc-tsserver', 'coc-vetur']
"FOLDING 
set foldnestmax=1
au BufReadPre *.css setlocal foldmethod=syntax


nnoremap <leader>fm :set foldmethod=manual<CR>
nnoremap <leader>fs :set foldmethod=syntax<CR>
nnoremap <leader>fi :set foldmethod=indent<CR>

"MISC
"set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20
nnoremap <leader>s :source ~/confs/nvim/init.vim<CR>
autocmd VimEnter * hi CursorLine ctermbg=blue  guibg=#262526
set cursorline




"RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
au VimEnter * RainbowParentheses
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

"CS
autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE
colorscheme onedark

"TabLine
set showtabline=2

function TabLine()
 let cc = '%#Search#'
 let sc = '%#DiffDelete#'
 let sc2 = '%#ErrorMsg#'
 let nsc = '%#WildMenu#'
 let nsc2 = '%#Directory#'
 let s:nc = "%#Normal#"


 let s = ''
	  for i in range(tabpagenr('$'))
	    if i + 1 == tabpagenr()
      "Selected
	      let s ..= l:sc.'%#TabLineSel#'
        let s ..= l:sc.' %a' .. (i + 1) .. ''.l:sc.' ' "Page Number
	      let s ..= l:sc.' %{Label(' .. (i + 1) .. ')} '.l:sc2.'' "Label

	    else
      "Non Selected
        let s ..= s:nc.' %{Label(' .. (i + 1) .. ')}  ' "Label
	    endif
	  endfor
	 	let s ..= '%#TabLineFill#%T' "Fill
    
	  if tabpagenr('$') > 1
	    let s ..= '%=%#TabLine#%999X'.l:cc.''.l:cc.' [ x ] ' "Close
	  endif

    return s
endfunction

function Label(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction
set tabline=%!TabLine()

"StausBar
""""
function StatusBar()
  let pc = '%#DiffDelete#'
  let pc2 = '%#ErrorMsg#'

  let sc = '%#WildMenu#'
  let sc2 = '%#Directory#'

  let cc = '%#LineNr#'
  let &statusline=
        \ l:pc.' [ %{ObsessionStatus()} ] '.l:pc2.''
        \.l:sc.'  %f  '.l:sc.l:sc2.''
        \'%='
        \.l:sc2.''.l:sc.' %y '.l:sc.''
        \.l:pc2.''.l:pc.' [ %l,%c ] '
        \.l:pc.' [ %p%%  ] '
endfunction
call StatusBar()


