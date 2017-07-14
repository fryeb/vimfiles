set relativenumber
set number

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

syntax on "Enable Syntax Highlighting

" Prevent Vim from leaving swapfiles everywhere
set nobackup
set noswapfile
set nowritebackup

" Tab Settings
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" Setup Pathogen for Plugin Management
call pathogen#helptags()
call pathogen#infect()

" Commands to add newlines without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" gVim Stuff
" No menu no toolbar
set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Consolas:h13:cANSI

set background=dark
colorscheme solarized
if has('termguicolors')
	set termguicolors
else
	let g:synthwave_termcolors=256
endif
