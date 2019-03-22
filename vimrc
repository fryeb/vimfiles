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

" Normal Mode
nmapclear
nnoremap <leader>f :find<space>
nnoremap <leader>w :w<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>q @q
nnoremap <leader>s :set<space>
nnoremap <esc> :noh

" Build Stuff
set makeprg=''
nnoremap <leader>m :w<cr>:make<cr>
nnoremap <leader>M :let &makeprg="
nnoremap <leader>n :cn
nnoremap <leader>p :cp

" Window Navigation
nnoremap <leader><tab> <C-w><C-w>
nnoremap <C-w><C-w> <nop>

" Self Editing
nnoremap <leader>ev :w<cr> :o $MYVIMRC<cr>
nnoremap <leader>eg :w<cr> :o $MYGVIMRC<cr>
if has('gui')
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr> :source $MYGVIMRC<cr>
else
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr>
endif

" Insert Mode
imapclear
inoremap jk <esc>be
inoremap kj <esc>be
inoremap <esc> <nop>

