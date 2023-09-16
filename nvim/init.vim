" #####################################
" Basic Configuration
" #####################################
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " ignore case
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


" #####################################
" Plugins
" #####################################
call plug#begin()
" Plugin Section
 Plug 'dracula/vim'
 Plug 'morhetz/gruvbox'
 Plug 'vim-airline/vim-airline'
 Plug 'ryanoasis/vim-devicons'
 Plug 'honza/vim-snippets'
 Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
 Plug 'tiagovla/scope.nvim'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox

" #####################################
" Remaps
" #####################################
" TAB
" ============
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>

nnoremap te :tabedit<Space>
nnoremap tn :tabnew .<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-t> :NERDTreeFind<CR>
nnoremap td :tabclose<CR>

nnoremap tmk :tabm +<CR>
nnoremap tmj :tabm -<CR>
nnoremap tml :tabm<CR>
nnoremap tmh :tabm 0<CR>


" Panes
" ==================
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Misc
" ==================
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

source ~/.config/nvim/coc.vim

" #####################################
" Plugins Configuration
" #####################################
" NERDCommenter
" ============
" nnoremap <C-/> <leader>c<space><CR>

" NERDTree
" ============
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
" Open NERDTree in the directory of the current file (or /home if no file is open)
nmap <silent> <C-t> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" Telescope
 "============
" Find files using Telescope command-line sugar.
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>


" bufferline
" ============
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        mode = 'tabs'
    }
}
EOF

