" Basics
let mapleader=" "
let maplocalleader="-"
set notimeout
set ttimeoutlen=100
set timeoutlen=100

" Make it easier to (e)dit and (r)eload VIMRC
echom ">^.^<"
nnoremap <leader>h :echom "hello"
nnoremap <leader>e :find $MYVIMRC<cr> 
nnoremap <leader>r :source $MYVIMRC<cr>

" Display Stuff
syntax enable
set nocompatible
set autoindent
set incsearch
set wildmenu
set scrolloff=2

" Insert Mode
inoremap <esc> <nop>
inoremap jk <esc>be
inoremap kj <esc>be

" Normal Mode
nnoremap <leader><leader> :find **/*
