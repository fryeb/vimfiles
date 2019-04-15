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
inoremap jk <esc>be
inoremap kj <esc>be
inoremap <esc> <nop>
inoremap <tab> <C-n>
inoremap <S-tab> <C-p>

" Normal Mode
nmapclear
nnoremap <leader>f :find<space>
nnoremap <leader>w :w<cr>
nnoremap <leader>v :vsplit<cr>:find<space>
nnoremap <leader>s :split<cr>:find<space>
nnoremap <leader>q :q<cr>
nnoremap <leader>2 @q
nnoremap <leader>s :set<space>
nnoremap <esc> :noh<cr>
" Sets mark at current position, indents surounding block, jumps back to current position
nnoremap <tab> mm=a{'m

" Build Stuff
set makeprg=''
nnoremap <leader>m :w<cr>:make<cr>
nnoremap <leader>M :let &makeprg="
nnoremap <leader>c :cc<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>p :cp<cr>

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


