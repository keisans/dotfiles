"******** INIT *******************************
"kill vi compatability and make vim useful
set nocompatible
silent! if plug#begin('~/.vim/bundle')
"style plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'

"nav plugins
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"edit plugins
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" syntax plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'

"color schemes
Plug 'GGalizzi/cake-vim'

"linting
Plug 'scrooloose/syntastic'

"git
Plug 'tpope/vim-fugitive'
call plug#end()
endif

"turn on filetype plugin
filetype plugin indent on

"*********** GENERAL ******************************
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

"********* COLORS & THEME *******************************
"set colors
set t_Co=256
set background=light
colorscheme luna-term
"Turn on syntax hilighting
syntax on
"hilihgt current line
set cursorline

"Hilight search resluts
set incsearch
set hlsearch

"always show the status bar
set laststatus=2

"nvim color options
if has("nvim")
  colorscheme luna
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"****** SHORTCUTS AND KEYBOARD ************************
"set the leader to the , key, since that's way easier than the default
let mapleader = ","
let g:mapleader = ","

"End search hilighting when you hit esc in normal mode
nnoremap <silent> \ :nohlsearch<CR>

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

" Manage vim like a boss
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Close all other splits for distraction-free!
nnoremap <Leader>df :only<CR>

" Get me out of insert mode using jk!
inoremap jk <Esc>

" Always use more magic
nnoremap / /\v
nnoremap ? ?\v

" File explorer
nnoremap <Leader>t :Explore<CR>

" Buffer nav
nnoremap <Leader>j :bnext<CR>
nnoremap <Leader>k :bprev<CR>

"****** ABBREVIATIONS *********************************

"****** FUNCTIONS *************************************

nnoremap <Leader>y :call VC_vim_card()<CR>
command! -nargs=? Card :call VC_vim_card(<f-args>)

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"****** TERN ******************************************
"enable keyboard shortcuts
let g:tern_map_keys=1
"show arg hints
let g:tern_show_argument_hints='on_hold'

"****** NERDTree *************************************
"map <C-e> :NERDTreeTabsToggle<CR>:NERDTreeMirrorOpen<CR>
"map <leader>e :NERDTreeFind<CR>
"nmap <leader>nt :NERDTreeFind<CR>
"let NERDTreeShowBookmarks=1
"let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$[[dir]]', '\.hg', '\.svn', '\.bzr']
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=0
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=1
"let g:nerdtree_tabs_open_on_console_startup=1
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
""locate current file in NERDTree
"map <leader>l :NERDTreeFind<cr>
""close vim if only nerdtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
let g:airline_theme = 'luna'

"****** SYNTASTIC **************************************
let g:syntastic_javascript_checkers = ["eslint"]

""******* DELIMITMATE *********************************
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

"******* CTRLP *****************************************
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"nnoremap <Leader>p :CtrlPMRU<CR>

"****** VIM-JAVASCRIPT *********************************
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0

"****** FZF ********************************************
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>P :Files<CR>
nnoremap <Leader>p :History<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>c :Colors<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"**** ACK **********************************************
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
