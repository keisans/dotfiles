if exists("loaded_vim_card")
  finish
endif
let loaded_vim_card = 1

function! VC_vim_card(...)
  if a:0 > 0
    let query = a:1
  else
    let query = "vim"
  end
  let code = system("card ". query)
  let window = bufwinnr("__vim_card__")
  if window < 0
    split __vim_card__
  else
    exe window . "wincmd w"
  end
  normal! ggdG
  setlocal buftype=nofile
  call append(0, split(code, '\v\n'))
endfunction

