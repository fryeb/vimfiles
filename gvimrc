
colorscheme solarized

set guioptions-=m
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has("win32")
	set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
                        \geom:1,renmode:5,taamode:1
	set guifont=Inconsolata:h11
else
	set guifont="DejaVu Sans Mono 10"
endif
