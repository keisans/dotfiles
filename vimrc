"******** INIT *******************************
"
silent! if plug#begin('~/.vim/bundle')
"style plugins
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'haya14busa/incsearch.vim'
Plug 'ryanoasis/vim-devicons'

"nav plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'jamessan/vim-gnupg'
Plug 'wellle/targets.vim'
Plug 'unblevable/quick-scope'

" syntax plugins
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim' | Plug 'ianks/vim-tsx'
Plug 'jparise/vim-graphql'

" Language Services
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Format plugin
Plug 'sbdchd/neoformat'

"color schemes
Plug 'GGalizzi/cake-vim'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'tomasr/molokai'
"Plug 'chriskempson/vim-tomorrow-theme'
"Plug 'jnurmine/Zenburn'
Plug 'jonathanfilip/vim-lucius'
"Plug 'altercation/vim-colors-solarized'
"Plug 'danilo-augusto/vim-afterglow'
"Plug 'mhartington/oceanic-next'

"linting
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

"don't show --INSERT-- (covered by lightline)
set noshowmode

"case match intelligently
set ignorecase
set smartcase

"allow safe per-directory vimrc
set exrc
set secure

set noswapfile

"Prevent swp and undo file clutter
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

" Set the dictionary to the std dict
set dictionary=/usr/share/dict/words

"********* COLORS & THEME *******************************

" Quickscope colors
augroup color_overrides
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#ff9a00' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#00a2ff' gui=underline ctermfg=81 cterm=underline
  autocmd ColorScheme * highlight Todo gui=italic
  autocmd ColorScheme * highlight Comment gui=italic
augroup END

"set colors
set t_Co=256
set background=dark
colorscheme lucius
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
  let g:python3_host_prog = '/usr/local/bin/python3'

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

" dismiss preview
nnoremap <C-x> <C-W>z

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

" indent in the current block (c-style)
nnoremap ga =i{

if has('nvim')
  tnoremap <C-J> <C-\><C-N><C-W><C-J>
  tnoremap <C-K> <C-\><C-N><C-W><C-K>
  tnoremap <C-L> <C-\><C-N><C-W><C-L>
  tnoremap <C-H> <C-\><C-N><C-W><C-H>
endif

"****** FOLDS ****************************************
nnoremap <silent> <Leader><Space> za
vnoremap <Space> zf
set foldlevelstart=99

"****** AUTOCMDS *** *********************************
augroup spellcheck
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
  autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

augroup folds
  autocmd!
  autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx setlocal foldmethod=syntax
augroup END

"****** ABBREVIATIONS *********************************

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

function! SynStack() abort
  if !exists("*synstack")
    return
  endif
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunc

command! HiCheck :call SynStack()<CR>

function! LightTheme () abort
  colorscheme lucius
  set background=light
endfunction

function! DarkTheme () abort
  colorscheme one
  set background=dark
  AirlineTheme one
endfunction

command! Light :call LightTheme()<CR>
command! Dark :call DarkTheme()<CR>

function! FzfSpellSink(word) abort
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell() abort
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

nnoremap z= :call FzfSpell()<CR>

"***** LIGHTLINE *****************************************
let g:lightline = {
  \ 'colorscheme' : 'one',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['gitbranch', 'cocstatus', 'readonly', 'filename', 'modified']]
  \   },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'filetype': 'IconFiletype',
  \   'fileformat': 'IconFileformat',
  \   'cocstatus': 'coc#status'
  \   }
  \ }

function! IconFiletype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! IconFileformat() abort
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

augroup cocCommands
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update
augroup END

"******** ALE ********************************************
let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1

let g:ale_linter_aliases = {'javascript.jsx': 'javascript'}

let g:ale_linters = { 
\  'javascript': [ 'eslint' ],
\  'typescript': [ 'tsserver' ]
\}

let g:ale_fixers = { 
\  'javascript': [ 'eslint' ],
\}


nmap <silent> <Leader>e <Plug>(ale_previous_wrap)
nmap <silent> <Leader>r <Plug>(ale_next_wrap)

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
nnoremap <Leader>c :<C-u>Colors<CR>
nnoremap <Leader>f :<C-u>Rg<CR>
nnoremap <Leader>m :<C-u>Tags<CR>

nnoremap <Leader>. :silent execute "Rg " . expand("<cword>")<CR>

nmap <leader><tab> <Plug>(fzf-maps-n)
xmap <leader><tab> <Plug>(fzf-maps-x)
omap <leader><tab> <Plug>(fzf-maps-o)

imap <c-x><c-k> <Plug>(fzf-complete-word)
imap <c-x><c-f> <Plug>(fzf-complete-path)
imap <c-x><c-j> <Plug>(fzf-complete-file-ag)
imap <c-x><c-l> <Plug>(fzf-complete-line)

let g:fzf_layout = {'window': '15split enew'}
let g:fzf_buffers_jump = 1

"**** ACK **********************************************
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


"**** GUTENTAGS ********************************************
let g:gutentags_file_list_command = {
  \ 'markers' : {
    \ '.git': 'git ls-files',
    \ '.hg': 'hg files'
  \ },
\ }

let g:gutentags_ctags_exclude = ['package-lock.json']

"**** INCSEARCH ********************************************
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"**** DEOPLETE ******************************************
" if has("nvim")
"   let g:deoplete#enable_at_startup = 1
"   autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"   inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
"   inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" endif


"**** LANGUAGE-SERVER *****************************************
" let g:LanguageClient_serverCommands = {
"       \ 'javascript': ['javascript-typescript-stdio'],
"       \ 'javascript.jsx': ['javascript-typescript-stdio'],
"       \ 'typescript': ['javascript-typescript-stdio'],
"       \ 'typescript.tsx': ['javascript-typescript-stdio'],
"       \ }
" nnoremap <leader>j :call LanguageClient_contextMenu()<CR>
" nnoremap gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <leader>x :call LanguageClient_textDocument_hover()<CR>
" nnoremap <leader>lf :call LanguageClient_textDocument_documentSymbol()<CR>

"**** COC ****************************************************
inoremap <expr><tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <silent> <leader>j :call CocActionAsync('doHover')<CR>

imap <C-j> <Plug>(coc-snippets-expand-jump)

augroup coc
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

"**** QUICKSCOPE **************************************
let g:qs_max_chars=120

"Meee
if !exists("g:snips_author")
  let g:snips_author="@keisans"
endif
