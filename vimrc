"******** INIT *******************************
"kill vi compatability and make vim useful
set nocompatible
"Turn on all mah plugins
execute pathogen#infect()

"*********** GENERAL ******************************
"let backspace delete line endings and indents, etc
set backspace=indent,eol,start

"automatically indent
set autoindent
"set the title of the window
set title

"show line numbers
set relativenumber
set number
"allow safe per-directory vimrc
set exrc
set secure

"********* COLORS & THEME *******************************
"set colors
colors molokai
"Turn on syntax hilighting
syntax on
"hilihgt current line
set cursorline

"Hilight search resluts
set incsearch
set hlsearch

"****** SHORTCUTS AND KEYBOARD ************************
"set the leader to the , key, since that's way easier than the default
let mapleader = ","
let g:mapleader = ","

"End search hilighting when you hit enter in normal mode
:nnoremap <silent> <CR> :nohlsearch<CR><CR>

"do the splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"buffer traversal shortcuts
nnoremap <C-t>  :enew<CR>
nnoremap <C-t>l :bnext<CR>
nnoremap <C-t>h :bprev<CR>
nnoremap <C-t>w :bp <BAR> bd #<CR>

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
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
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

