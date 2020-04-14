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
set autoread

let mapleader=" "
let maplocalleader="-"
set timeout
set timeoutlen=300
set ttimeoutlen=300

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" Indentation
set tabstop=4
set softtabstop=0
set noexpandtab
autocmd FileType python set expandtab
set shiftwidth=4
"set colorcolumn=100

" Disable Swapfiles
set nobackup
set nowritebackup
set noswapfile

" Command Mode
cmapclear
cnoremap kj <esc>
cnoremap jk <esc>

" Insert Mode
imapclear
inoremap <S-space> <C-p>
inoremap kj <esc>
inoremap jk <esc>
inoremap <S-cr> <C-n>

" Normal Mode
nmapclear
nnoremap <leader>f :find<space>
"nnoremap <leader>w :w <cr>
nnoremap <leader>w :call SaveAndFormat()<cr>

nnoremap <leader>o :o<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>2 @q
nnoremap <leader>s :set<space>
nnoremap <esc> :noh<cr>
nnoremap <tab> <C-w><C-w>
nnoremap <C-w><C-w> <nop>

" Visual Mode
vmapclear
vnoremap jk <esc>
vnoremap <esc> <nop>

" Build Stuff
set makeprg="build"
nnoremap <leader>m :wa<cr>:make<cr><cr>:cw<cr>:cc<cr>
nnoremap <leader>M :let &makeprg="
nnoremap <leader>c :cw<cr>:cc<cr>
nnoremap <leader>n :cw<cr>:cn<cr>
nnoremap <leader>p :cw<cr>:cp<cr>

" Self Editing
nnoremap <leader>ev :w<cr> :o $MYVIMRC<cr>
nnoremap <leader>eg :w<cr> :o $MYGVIMRC<cr>
if has('gui')
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr> :source $MYGVIMRC<cr>
else
	nnoremap <leader>r :w<cr> :source $MYVIMRC<cr>
endif

" Git Stuff
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ?'  ' . split(l:branchname)[0] .' ':''
endfunction

let g:git_branch = StatuslineGit()

" Status Line

function! GetModeStatusText() "{{{
	if (mode() ==# 'n')
		hi! StatusMode guifg=#002b36 guibg=#268bd2
		return 'NORMAL '
	elseif (mode() =~# '\v(v|V)')
		hi! StatusMode guifg=#002b36 guibg=#d33682
		return 'VISUAL '
	elseif (mode() ==# 'i')
		hi! StatusMode guifg=#002b36 guibg=#719e07
		return 'INSERT '
	elseif (mode() ==# 'c')
		hi! StatusMode guifg=#002b36 guibg=#cb4b16
		return 'SEARCH '
	else
		echom mode()

		hi! StatusMode guifg=#002b36 guibg=#ff0000
		return 'UNKNOWN '
	endif

endfunction "}}}

set laststatus=2
set statusline=
set statusline+=%#StatusMode#
set statusline+=\ %{GetModeStatusText()}
set statusline+=%#PmenuSel#     " Color
set statusline+=%{g:git_branch} " Git
set statusline+=%#LineNr#       " Color
set statusline+=\ %f            " FileName
set statusline+=%m\             " Show if file has been modified
set statusline+=%=              " Align to the right
set statusline+=%#CursorColumn# " Color
set statusline+=\ %y            " File Type
set statusline+=\ %l:%c
set statusline+=\ 

function! SaveAndFormat()
	w
	if (exists("b:current_syntax"))
		if (b:current_syntax ==# "c")
			execute "silent !clang-format -i " . bufname("%")
		elseif (b:current_syntax ==# "cpp")
			execute "silent !clang-format -i " . bufname("%")
		endif
	endif
endfunction

