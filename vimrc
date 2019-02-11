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

" Default Tab Settings
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=8
set tabstop=8

nnoremap Q @q
nnoremap Y ^y$

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
function! Tab_Or_Complete_Backwards()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
inoremap <S-Tab> <C-R>=Tab_Or_Complete()<CR>
nnoremap <Tab> *
nnoremap <S-Tab> #

" Allow indentation to be overriden by file type
filetype plugin indent on

set hlsearch
set updatetime=10
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'SameWord' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

" Screen Refresh Code (for ligatures)
inoremap <Esc> <Esc><C-L>
nnoremap <C-Tab> <C-L>:let<Space>@/<Space> = <Space>""<CR>

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
set guifont=Consolas:h10

set background=dark
colorscheme ben
if has('termguicolors')
	set termguicolors
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
