if exists("loaded_vim_card")
  finish
endif
let loaded_vim_card = 1

function! VC_vim_card()
  let code = system("card vim")
  split __vim_card__
  normal! ggdG
  setlocal filetype=markdown
  setlocal buftype=nofile
  call append(0, split(code, "\v\n"))
endfunction

