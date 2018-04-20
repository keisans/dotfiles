"******** INIT *******************************
"kill vi compatability and make vim useful
if &compatible
  set nocompatible
endif

silent! if plug#begin('~/.vim/bundle')
"style plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'haya14busa/incsearch.vim'

"nav plugins
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-vinegar'

"tags
Plug 'ludovicchabant/vim-gutentags'

"edit plugins
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'jamessan/vim-gnupg'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" syntax plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }
Plug 'HerringtonDarkholme/yats.vim' | Plug 'ianks/vim-tsx'
Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs'


" Format plugin
Plug 'sbdchd/neoformat'

"color schemes
Plug 'GGalizzi/cake-vim'
Plug 'rakr/vim-one'
"Plug 'lifepillar/vim-solarized8'
"Plug 'tomasr/molokai'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'jnurmine/Zenburn'
"Plug 'jonathanfilip/vim-lucius'
"Plug 'altercation/vim-colors-solarized'
"Plug 'danilo-augusto/vim-afterglow'
"Plug 'mhartington/oceanic-next'

"linting
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

"git
Plug 'tpope/vim-fugitive'
call plug#end()
endif

"turn on filetype plugin
filetype plugin indent on

"*********** GENERAL ******************************
" set encoding for everything
set encoding=utf-8

"let backspace delete line endings and indents, etc
set backspace=indent,eol,start

"automatically indent
set autoindent
"set up tab widths
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

"allow mouse?
set mouse=a

"set the title of the window
set title

"automatically update files
set autoread

"show trailing spaces and tabs
set list listchars=tab:»·,trail:·,nbsp:·

"show line numbers
set relativenumber
set number

"more natural splits
set splitbelow
set splitright

"show command
set showcmd

"case match intelligently
set ignorecase
set smartcase

"allow safe per-directory vimrc
set exrc
set secure

"Prevent swp and undo file clutter
set backupdir=~/.vim/backups
set directory=~/.vim/swap

" Set the dictionary to the std dict
set dictionary=/usr/share/dict/words

"********* COLORS & THEME *******************************
"set colors
set t_Co=256
set background=dark
colorscheme luna-term
"Turn on syntax hilighting
if !exists("g:syntax_on")
  syntax enable
endif
"hilihgt current line
set cursorline

"Hilight search resluts
set incsearch
"set hlsearch

"always show the status bar
set laststatus=2

"set truecolor if available
if has("termguicolors")
  set termguicolors
endif

"nvim specific options
if has("nvim")
  colorscheme one
  set background=dark
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'
endif

"****** SHORTCUTS AND KEYBOARD ************************
"set the leader to the , key, since that's way easier than the default
let mapleader = ","
let g:mapleader = ","

"End search hilighting when you hit esc in normal mode
nnoremap <silent> \ :<C-u>nohlsearch<CR>

"do the splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize the splits
" Maximize width (window-width)
nnoremap <Leader>ww <C-W>|
" Equalize splits (window-equal)
nnoremap <Leader>we <C-W>=
" Maximize height (window...it's just in line with the others)
nnoremap <Leader>wr <C-W>_
" Close current window (window-quit) safer than :q
nnoremap <Leader>wq :clo<CR>

"buffer traversal shortcuts
" New buffer
"Traversing buffers

" Remap U to <C-R> because U is dumb
nnoremap U <C-R>

" Because I'm bad with the shift key
cnoremap WQ wq
cnoremap Wq wq
cnoremap W w
cnoremap Q q

" Manage vim
nnoremap <Leader>ev :<C-u>vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :<C-u>source $MYVIMRC<CR>

" Close all other splits for distraction-free!
nnoremap <Leader>df :<C-u>only<CR>

" Get me out of insert mode using jk!
inoremap jk <Esc>

" Always use more magic
"nnoremap / /\v
"nnoremap ? ?\v

" Swap to previous buffer
nnoremap <Leader>; :<C-u>b#<CR>

"****** ABBREVIATIONS *********************************

"****** FUGITIVE **************************************
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>


"****** OMNIFUNCS *************************************
" augroup omnifuncs
"   autocmd!
"   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" augroup end

"****** FUNCTIONS *************************************

nnoremap <Leader>y :<C-u>call VC_vim_card()<CR>
command! -nargs=? Card :call VC_vim_card(<f-args>)

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime) abort
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

function! LightTheme () abort
  colorscheme lucius
  set background=light
  AirlineTheme papercolor
endfunction

function! DarkTheme () abort
  colorscheme one
  set background=dark
  AirlineTheme one
endfunction

command! Light :call LightTheme()<CR>
command! Dark :call DarkTheme()<CR>

"****** TERN ******************************************
" Use tern_for_vim.
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1

"if exists('g:plugs["tern_for_vim"]')
  "use term for autocomplete if it's on
  " augroup tern_completion
  "   autocmd!
  "   autocmd FileType javascript,jsx,javascript.jsx setlocal omnifunc=tern#Complete
  " augroup end
"endif

"***** AIRLINE *****************************************
"enable airline tab bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'one'
let g:airilne#extensions#gutentags#enabled = 1
function! AirlineInit()
  let g:airline_section_y = airline#section#create(['gutentags'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
"let g:airline#extensions#syntastic#enabled = 1

"****** SYNTASTIC **************************************
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss', 'coffee'] }

"******** ALE ********************************************
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_set_quickfix = 0

let g:ale_linter_aliases = {'javascript.jsx': 'javascript'}

let g:ale_linters = { 'javascript': [ 'eslint' ] }

""******* DELIMITMATE *********************************
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
imap <C-L> <Plug>delimitMateS-Tab

"****** VIM-JAVASCRIPT *********************************
let g:jsx_ext_required = 0

"****** FZF ********************************************
nnoremap <C-p> :<C-u>GFiles<CR>
nnoremap <Leader>P :<C-u>Files<CR>
nnoremap <Leader>p :<C-u>History<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>
nnoremap <Leader>l :<C-u>Lines<CR>
nnoremap <Leader>c :<C-u>Colors<CR>
nnoremap <Leader>g :<C-u>Ag<CR>
nnoremap <Leader>m :<C-u>Tags<CR>

nnoremap <Leader><Space> :silent execute "Ag " . expand("<cword>")<CR>

nmap <leader><tab> <Plug>(fzf-maps-n)
xmap <leader><tab> <Plug>(fzf-maps-x)
omap <leader><tab> <Plug>(fzf-maps-o)

imap <c-x><c-k> <Plug>(fzf-complete-word)
imap <c-x><c-f> <Plug>(fzf-complete-path)
imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
imap <c-x><c-l> <Plug>(fzf-complete-line)

"**** ACK **********************************************
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"**** INCSEARCH ********************************************
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"**** DEOPLETE ******************************************
if has("nvim")
  let g:deoplete#enable_at_startup = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
endif

"**** NEOSNIPPETS *******************************************
imap <C-k>  <Plug>(neosnippet_expand_or_jump)

"**** EASYMOTION *******************************************
let g:EasyMotion_do_mapping = 0

nmap s <Plug>(easymotion-bd-f2)

nmap <Leader>n <Plug>(easymotion-bd-n)

nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)


"**** TYPESCRIPT *********************************************
"let g:nvim_typescript#type_info_on_hold=1

"**** NEOFORMAT ***********************************************
"let g:neoformat_enabled_javascript = ['prettier']
" let g:neoformat_try_formatprg = 1
" augroup format
"   autocmd!
"   autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\ --stdin\ --single-quote
"   autocmd BufWrite *.js Neoformat
" augroup END
