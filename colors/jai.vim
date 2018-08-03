" Vim Color File

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="jai"

if !exists("g:jai_termcolors")
  let g:jai_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:jai_terminal_italics")
  let g:jai_terminal_italics = 0
endif

" This function is based on one from Onedark: https://github.com/joshdick/onedark/
" Which in turn was based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:jai_terminal_italics == 0
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

"public {{
function! jai#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction
"public end }}

" Color Variables
let s:fg 	= { "gui": "#b6a997", "cterm":"146"}
let s:bg 	= { "gui": "#072727", "cterm":"53" }
let s:comment 	= { "gui": "#6ad65d", "cterm":"30" }
let s:key 	= { "gui": "#eeffff", "cterm":"53" }
let s:type 	= { "gui": "#bbffcc", "cterm":"53" }
let s:num 	= { "gui": "#0099aa", "cterm":"53" }
let s:string 	= { "gui": "#00aa99", "cterm":"53" }
let s:cursor 	= { "gui": "#fffbd9", "cterm":"53" }
let s:meta 	= { "gui": "#F7F06F", "cterm":"53" }
let s:error 	= { "gui": "#F7F06F", "cterm":"53"}

" Syntax Groups (descriptions and ordering from `:h w18`) |
call s:h("SameWord", { "gui": "bold" }) " Same as current word
call s:h("Search", { "gui": "underline" }) " Last Search

call s:h("Comment", {"fg": s:comment, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:fg })
call s:h("String", { "fg": s:string })
call s:h("Character", { "fg": s:string })
call s:h("Number", { "fg": s:num })
call s:h("Boolean", { "fg": s:num })
call s:h("Float", { "fg": s:num })
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
"call s:h("Error", { "fg": s:fg })
call s:h("Todo", {"fg": s:key }) " TODO, FIXME, XXX ...

" +----------------------------------------------------------------------+
" | Highlighting Groups (descriptions and ordering from `:h hitest.vim`) |
" +----------------------------------------------------------------------+

" call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
" call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:bg, "bg": s:cursor }) " the character under the cursor
call s:h("Directory", { "fg": s:num }) " directory names (and other special names in listings)
" call s:h("DiffAdd", { "bg": s:visual_grey}) " diff mode: Added line
" call s:h("DiffChange", { "bg": s:visual_grey }) " diff mode: Changed line
" call s:h("DiffDelete", { "fg": s:red }) " diff mode: Deleted line
" call s:h("DiffText", { "bg": s:visual_grey, "fg": s:yellow }) " diff mode: Changed text within a changed line
" call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:bg, "bg": s:bg}) " the column separating vertically split windows
" call s:h("IncSearch", { "fg": s:bg, "bg": s:yellow }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
" call s:h("MatchParen", { "fg": s:blue, "gui": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
" call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
" call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:bg }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:fg, "bg": s:bg }) " normal text
" call s:h("Pmenu", { "bg": s:menu_grey }) " Popup menu: normal item.
" call s:h("PmenuSel", { "fg": s:bg, "bg": s:blue }) " Popup menu: selected item.
" call s:h("PmenuSbar", { "bg": s:special_grey }) " Popup menu: scrollbar.
" call s:h("PmenuThumb", { "bg": s:fg }) " Popup menu: Thumb of the scrollbar.
" call s:h("Question", { "fg": s:turqoise }) " hit-enter prompt and yes/no questions
" call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("StatusLine", { "fg": s:bg, "bg": s:key }) " status line of current window
call s:h("StatusLineNC", { "fg": s:bg, "bg": s:fg }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("Title", { "fg": s:key, "gui": "bold"}) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:bg, "bg": s:fg }) " Visual mode selection
" call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
" call s:h("WildMenu", { "fg": s:bg, "bg": s:blue }) " current match in 'wildmenu' completion
