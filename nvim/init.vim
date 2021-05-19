call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" the obligatory block of tpope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" navigational plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" general editing
Plug 'Raimondi/delimitMate'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

" Completion
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }

" git
Plug 'airblade/vim-gitgutter'

" color schemes
Plug 'GGalizzi/cake-vim'
Plug 'rakr/vim-one'
Plug 'cocopon/iceberg.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'folke/tokyonight.nvim'

" light line
Plug 'itchyny/lightline.vim'

" lsp support
Plug 'neovim/nvim-lspconfig'
call plug#end()

" lua requires
lua require('lsp-config')

" ***** GENERAL *******************************************

set title

" line numbers
set relativenumber
set number

" natural line splits
set splitbelow
set splitright

" show last command
set showcmd

" more natural text search
set ignorecase
set smartcase

" safety stuff
set exrc
set secure

" I don't need your stinkin swap file
set noswapfile

set dictionary=/usr/share/dict/words

"set up tab widths
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" don't need the mode with lightline
set noshowmode

" ***** MAPPING ****************************************

" map the leader to the , key
let mapleader=","
let g:mapleader=","

" easier split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" split nav in terminal mode
if has('nvim')
  tnoremap <C-H> <C-\><C-N><C-W><C-H>
  tnoremap <C-J> <C-\><C-N><C-W><C-J>
  tnoremap <C-K> <C-\><C-N><C-W><C-K>
  tnoremap <C-L> <C-\><C-N><C-W><C-L>
endif

" I'm really bad at not holding shift
command WQ wq
command Wq wq
command W w
command Q q

" controversial jk to exit insert mode
inoremap jk <Esc>

" netrw refresh hack
nnoremap <C-R> <Plug>NetrwRefresh

" ***** COLOR ******************************************
set t_Co=256

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

colorscheme tokyonight


" ***** FZF ********************************************

nnoremap <C-p> :<C-u>GFiles<CR>
nnoremap <Leader>P :<C-u>Files<CR>
nnoremap <Leader>p :<C-u>History<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>
nnoremap <Leader>c :<C-u>Colors<CR>
nnoremap <Leader>f :<C-u>Rg<CR>

nnoremap <Leader>. :silent execute "Rg " . expand("<cword>")<CR>

" ***** ACK **********************************************
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ***** FOLKE plugins ***********************************
" Trouble config
lua << EOF
  require("trouble").setup {
    -- use default config for now
  }
EOF
" Trouble mappings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Which key config
lua << EOF
  require("which-key").setup {
    -- use defaults
  }
EOF

" todo config
lua << EOF
  require('todo-comments').setup {
    -- use defaults
  }
EOF

nnoremap <leader>t <cmd>TodoTrouble<cr>

" ***** Lightline *****************************************
let g:lightline = {'colorscheme': 'tokyonight'}

" ***** Completion ****************************************
autocmd BufEnter * lua require'completion'.on_attach()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'tabnine']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]
