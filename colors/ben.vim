" Vim Color File

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="ben"

if !exists("g:ben_termcolors")
  let g:ben_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:ben_terminal_italics")
  let g:ben_terminal_italics = 0
endif

" This function is based on one from Synthwave: https://github.com/exitface/synthwave.vim 
" Which in turn was based on one from Onedark: https://github.com/joshdick/onedark/
" Which in turn was based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:ben_terminal_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
  let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" Public Api
function! ben#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction

" Color Variables
let s:fg 	= { "gui": "#667777", "cterm":"146"}
let s:bg 	= { "gui": "#112222", "cterm":"53" }
let s:comment 	= { "gui": "#55dd77", "cterm":"30" }
let s:light_bg	= { "gui": "#334444", "cterm":"53" }
let s:key 	= { "gui": "#99FFFF", "cterm":"53" }
let s:type 	= { "gui": "#2299bb", "cterm":"53" }
let s:const 	= { "gui": "#22bb99", "cterm":"53" }
let s:cursor 	= { "gui": "#00FFFF", "cterm":"53" }
let s:meta 	= { "gui": "#BBEEBB", "cterm":"53" }
let s:error	= { "gui": "#bb9922", "cterm":"53" }

" Editor Highlighting
call s:h("SameWord", { "gui": "bold" }) " Same as current word
call s:h("Search", { "gui": "underline" }) " Last Search

call s:h("Cursor", { "fg": s:bg, "bg": s:cursor }) " the character under the cursor
call s:h("Directory", { "fg": s:const }) " directory names (and other special names in listings)
call s:h("VertSplit", { "fg": s:bg, "bg": s:bg}) " '|' characters between windows (hidden)
call s:h("StatusLine", { "fg": s:bg, "bg": s:key }) " status line of current window
call s:h("StatusLineNC", { "fg": s:bg, "bg": s:fg }) " status line of other window
call s:h("Title", { "fg": s:key, "gui": "bold"}) " for output from ':set all', etc.
call s:h("Visual", { "fg": s:bg, "bg": s:fg }) " Visual mode selection
call s:h("NonText", { "fg": s:bg }) " '~' after text (and other 'fake' characters)

call s:h("Pmenu", { "bg": s:light_bg }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:bg, "bg": s:cursor }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:light_bg }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:light_bg }) " Popup menu: Thumb of the scrollbar.

call s:h("MatchParen", { "gui": "underline" })
call s:h("WildMenu", { "fg": s:cursor, "bg": s:light_bg })

" Content Highlighting
call s:h("Normal", { "fg": s:fg, "bg": s:bg })
call s:h("Comment", {"fg": s:comment})
call s:h("Constant", { "fg": s:const })
call s:h("String", { "fg": s:const })
call s:h("Character", { "fg": s:const })
call s:h("Number", { "fg": s:const })
call s:h("Boolean", { "fg": s:const })
call s:h("Float", { "fg": s:const })
call s:h("Identifier", { "fg": s:fg })
call s:h("Function", { "fg": s:fg })
call s:h("Statement", { "fg": s:key })
call s:h("Conditional", { "fg": s:key })
call s:h("Repeat", { "fg": s:key })
call s:h("Label", { "fg": s:key })
call s:h("Operator", { "fg": s:key })
call s:h("Keyword", { "fg": s:key })
call s:h("Exception", { "fg": s:key })
call s:h("PreProc", { "fg": s:meta })
call s:h("Include", { "fg": s:meta })
call s:h("Define", { "fg": s:meta })
call s:h("Macro", { "fg": s:meta })
call s:h("PreCondit", { "fg": s:meta })
call s:h("Type", { "fg": s:type })
call s:h("StorageClass", { "fg": s:key })
call s:h("Structure", { "fg": s:key })
call s:h("Typedef", { "fg": s:key })
call s:h("Special", { "fg": s:fg })
call s:h("SpecialChar", {})
call s:h("Error", { "fg": s:error })
call s:h("Todo", {"fg": s:key }) " TODO, FIXME, XXX ...

" Unused
" call s:h("DiffAdd", { "bg": s:visual_grey}) " diff mode: Added line
" call s:h("DiffChange", { "bg": s:visual_grey }) " diff mode: Changed line
" call s:h("DiffDelete", { "fg": s:red }) " diff mode: Deleted line
" call s:h("DiffText", { "bg": s:visual_grey, "fg": s:yellow }) " diff mode: Changed text within a changed line
" call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
" call s:h("IncSearch", { "fg": s:bg, "bg": s:yellow }) " 'incsearch' highlighting ':s///c'
" call s:h("Question", { "fg": s:turqoise }) " hit-enter prompt and yes/no questions
" call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
" call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
