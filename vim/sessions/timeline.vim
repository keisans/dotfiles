let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/projects/d3v4-timeline
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +2 src/App.css
badd +24 src/App.js
badd +23 src/Timeline.js
badd +14 src/ContextTimeline.js
badd +5 src/FocusTimeline.js
badd +35 src/FocusCuePoints.js
badd +233 ~/projects/d3timeline/src/index.js
badd +27 ~/projects/d3timeline/public/index.html
badd +38 public/index.html
badd +5 src/index.js
badd +2 src/FocusPlayhead.js
badd +34 package.json
badd +8 src/utils.js
badd +30 src/ContextBrush.js
argglobal
silent! argdel *
edit src/Timeline.js
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe '1resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 101 + 102) / 204)
exe '2resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 101 + 102) / 204)
exe '3resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 3resize ' . ((&columns * 102 + 102) / 204)
exe '4resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 4resize ' . ((&columns * 102 + 102) / 204)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 69 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
69
normal! 059|
lcd ~/projects/d3v4-timeline
wincmd w
argglobal
edit ~/projects/d3timeline/src/index.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 275 - ((1 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
275
normal! 0
lcd ~/projects/d3v4-timeline
wincmd w
argglobal
edit ~/projects/d3v4-timeline/src/FocusTimeline.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 32 - ((15 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 03|
lcd ~/projects/d3v4-timeline
wincmd w
argglobal
edit ~/projects/d3v4-timeline/src/ContextBrush.js
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((5 * winheight(0) + 13) / 27)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 010|
lcd ~/projects/d3v4-timeline
wincmd w
exe '1resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 1resize ' . ((&columns * 101 + 102) / 204)
exe '2resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 2resize ' . ((&columns * 101 + 102) / 204)
exe '3resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 3resize ' . ((&columns * 102 + 102) / 204)
exe '4resize ' . ((&lines * 27 + 29) / 58)
exe 'vert 4resize ' . ((&columns * 102 + 102) / 204)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
