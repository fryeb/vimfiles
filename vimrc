set nonumber
set norelativenumber

syntax on "Enable Syntax Highlighting

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Prevent Vim from leaving swapfiles everywhere
set nobackup
set noswapfile
set nowritebackup

set showcmd

" Tab Settings
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=8
set tabstop=8

" Screen Refresh Code (for ligatures)
inoremap <Esc> <Esc><C-L>

" Commands to add newlines without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <S-W> <C-W><C-W>
set equalalways
nnoremap <Space> :find<Space>
nnoremap <S-Space> :Explore <Enter>

" Commands for the terminal
nnoremap t :terminal<Enter>
nnoremap <S-T> <C-W><C-W>:terminal<Enter>
tnoremap <Esc> <C-\><C-n>

" gVim Stuff
" No menu no toolbar
set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
	set guioptions-=L
set guifont=Fira\ Code:h10

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
let g:netrw_liststyle = 3 "Tree style listing

" Maximise on startup
autocmd GUIenter * simalt ~x

set renderoptions=type:directx
set encoding=utf-8
set ruler " Enable line and column in status line

" Build Stuff
function! s:build()
  let &makeprg='build --run'
  silent make
  wincmd w
  q
  vertical botright copen
  wincmd =
  wincmd w
endfunction
command! Build call s:build()

nnoremap <silent><F5>  :wa<CR>:Build<CR>:cn<CR>
nnoremap <silent><F1>  :cn<CR>
nnoremap <silent><F2>  :cp<CR>
nnoremap <silent><F11> :cn<CR>
nnoremap <silent><F12> :cp<CR>

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
