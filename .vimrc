set nocompatible
set encoding=utf-8
set hidden
syntax enable
filetype plugin on
set number
set nohlsearch
set background=dark
set noerrorbells
set nowrap
set noswapfile
set incsearch
set scrolloff=10
set signcolumn=yes
set colorcolumn=80
set ts=2 sw=2
let loaded_matchparen = 1
hi Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=blue
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
filetype plugin indent on
let g:ycm_cache_monifunc = 0

"remaps
nmap <F6> :NERDTreeToggle<CR>
inoremap kj <Esc>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"capital Y now just goes from cursor to end of line, like capital D and C
nnoremap Y y$
"center cursor on screen while searching n
nnoremap n nzz
"moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"always open buffer in new tab
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

" remaps with custom leader/command key
let mapleader = " "
nmap <leader>tr :NERDTreeToggle<CR>

" custom functions and autogroups
fun! TrimWhitespace()
		let l:save = winsaveview()
		keeppatterns %s/\s\+$//e
		call winrestview(l:save)
endfun

augroup Shawn
	"remove previous listeners in this group
	autocmd!
	"before you write the current buffer, call the function
	autocmd BufWritePre * :call TrimWhitespace()
augroup END
