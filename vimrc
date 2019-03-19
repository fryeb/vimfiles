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

set makeprg=''
nnoremap <leader>m :make<space>
nnoremap <leader>M :let &makeprg=

nnoremap <leader><tab> <C-w><C-w>
nnoremap <C-w><C-w> <nop>

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

