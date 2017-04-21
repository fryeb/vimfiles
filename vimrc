set relativenumber
set number

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

inoremap ;; <Esc> 
inoremap ; ;<CR>

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
call pathogen#runtime_append_all_bundles()

" Commands to add newlines without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
