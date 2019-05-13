
let colors=['monokai', 'solarized']
let colorIndex=localtime() % len(colors)
execute 'colorscheme '.colors[colorIndex]

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
if has("win32")
	set guifont=Consolas:h10
else
	set guifont="DejaVu Sans Mono 10"
endif
