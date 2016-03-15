"******** INIT *******************************
"kill vi compatability and make vim useful
set nocompatible
"Turn on all mah plugins
execute pathogen#infect()
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
"allow safe per-directory vimrc
set exrc
set secure

"Prevent swp and undo file clutter
set backupdir=~/.vim/backups
set directory=~/.vim/swap

"********* COLORS & THEME *******************************
"set colors
colors base16-monokai
let base16colorspace=256
set background=dark
"Turn on syntax hilighting
syntax on
"hilihgt current line
set cursorline

"Hilight search resluts
set incsearch
set hlsearch

"set the font for GUI editors
set guifont=hack
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"always show the status bar
set laststatus=2

"****** SHORTCUTS AND KEYBOARD ************************
"set the leader to the , key, since that's way easier than the default
let mapleader = ","
let g:mapleader = ","

"End search hilighting when you hit esc in normal mode
:nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

"do the splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"buffer traversal shortcuts
" New buffer
nnoremap <C-T>  :enew<CR>
"Close buffer
nnoremap <C-W> :bp <BAR> bd #<CR>
"Traversing buffers
nnoremap <C-T>l :bnext<CR>
nnoremap <C-T>h :bprev<CR>
nnoremap <C-T>w :bp <BAR> bd #<CR>

" Because I'm bad with the shift key
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q

"****** FUNCTIONS *************************************
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"****** TERN ******************************************
"enable keyboard shortcuts
let g:tern_map_keys=1
"show arg hints
let g:tern_show_argument_hints='on_hold'

"****** NERDTree *************************************
map <C-e> :NERDTreeTabsToggle<CR>:NERDTreeMirrorOpen<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git$[[dir]]', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"locate current file in NERDTree
map <leader>l :NERDTreeFind<cr>
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <Leader>p :CtrlPMRU<CR>

"****** VIM-JAVASCRIPT *********************************
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_required = 0
