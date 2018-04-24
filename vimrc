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

set showcmd

" Tab Settings
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" Commands to add newlines without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <S-W> <C-W><C-W>

" gVim Stuff
" No menu no toolbar
set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Consolas:h10:cANSI

set background=dark
colorscheme synthwave
if has('termguicolors')
	set termguicolors
else
	let g:synthwave_termcolors=256
endif

" File finding
set path +=**
set wildmenu

" Maximise on startup
autocmd GUIenter * simalt ~x

" Make sessions work automaticaly (remember not to commit sessions)
fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/Session.vim'
endfunction

fu! RestoreSess()
	if filereadable(getcwd() . '/Session.vim')
		execute 'source ' . getcwd() . '/Session.vim'
	endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()
