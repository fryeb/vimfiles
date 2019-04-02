
let colors=['desert', 'monokai', 'evening']
let colorIndex=localtime() % len(colors)
execute 'colorscheme '.colors[colorIndex]

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Consolas:h10
