" Pathogen
execute pathogen#infect()

" Basics
syntax enable
set nocompatible
set autoindent
set incsearch
set wildmenu
set path+=**/*
set scrolloff=2

let mapleader=" "
let maplocalleader="-"
set notimeout

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" Indentation
set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4

" Disable Swapfiles
set nobackup
set nowritebackup
set noswapfile

" Insert Mode
imapclear
inoremap jk <esc>
inoremap kj <esc>
inoremap <S-space> <C-p>
inoremap <S-cr> <C-n>
inoremap <esc> <nop>

" Normal Mode
nmapclear
nnoremap <leader>f :find<space>
nnoremap <leader>w :w<cr>
nnoremap <leader>o :o<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>2 @q
nnoremap <leader>s :set<space>
nnoremap <esc> :noh<cr>
" Sets mark at current position, indents surounding block, jumps back to current position
nnoremap = mmgg=G'm

" Build Stuff
set makeprg=''
nnoremap <leader>m :w<cr>:make<cr><cr>:cw<cr>:cc<cr>
nnoremap <leader>M :let &makeprg="
nnoremap <leader>c :cw<cr>:cc<cr>
nnoremap <leader>n :cw<cr>:cn<cr>
nnoremap <leader>p :cw<cr>:cp<cr>

" Window Navigation
nnoremap <tab> <C-w><C-w>
nnoremap <C-w><C-w> <nop>

" Self Editing
nnoremap <leader>ev :w<cr> :o $MYVIMRC<cr>
nnoremap <leader>eg :w<cr> :o $MYGVIMRC<cr>
if has('gui')
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr> :source $MYGVIMRC<cr>
else
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr>
endif


