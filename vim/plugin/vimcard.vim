if exists("loaded_vim_card")
  finish
endif
let loaded_vim_card = 1

function! VC_vim_card()
  15sview ~/.vim/card
  setlocal filetype=markdown
  autocmd BufLeave <buffer> :bwipeout
endfunction

