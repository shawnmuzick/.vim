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
set splitright
set splitbelow
let loaded_matchparen = 1
hi Normal guibg=NONE ctermbg=NONE
highlight ColorColumn ctermbg=blue
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
filetype plugin indent on
let g:ycm_cache_monifunc = 0
colorscheme codedark
"nerdtree open new tab by default, or just use "t"
"let NERDTreeMapOpenInTab='<ENTER>'

"remaps
let mapleader = " "
nmap <F6> :NERDTreeToggle<CR>
inoremap kj <Esc>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"easier window management
nnoremap <leader>w <C-w>
"capital Y now just goes from cursor to end of line, like capital D and C
nnoremap Y y$
"center cursor on screen while searching n
nnoremap n nzz
"moving lines
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap gf <C-W>gf
"always open buffer in new tab
nnoremap gf <C-W>gf
"splits
nnoremap <silent> <C-left> :vertical resize +3<CR>
nnoremap <silent> <C-right> :vertical resize -3<CR>
nnoremap <silent> <C-up> :resize +3<CR>
nnoremap <silent> <C-down> :resize -3<CR>
"flip orientation
map <leader>th <c-w>t<c-w>H
map <leader>tk <c-w>t<c-w>K
"buffers
nnoremap <leader>bk :bw<CR>
"terminal
map <leader>tt :term<CR>
"command abbreviations
"make verm always vertical split right
"ca term vert term
nmap <leader>tr :NERDTreeToggle<CR>
map <leader>vv :Vifm<CR>
map <leader>vs :VsplitVifm<CR>
map <leader>sp :SplitVifm<CR>
map <leader>dv :DiffVifm<CR>
map <leader>tv :TabVifm<CR>

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
