"    _       _ _         _
"   (_)_ __ (_) |___   _(_)_ __ ___
"   | | '_ \| | __\ \ / / | '_ ` _ \
"   | | | | | | |_ \ V /| | | | | | |
"   |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

let mapleader =	" "

source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/coc-prettier.vim
source $HOME/.config/nvim/plug-config/coc-snippets.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim


"          _             _
"    _ __ | |_   _  __ _(_)_ __  ___
"   | '_ \| | | | |/ _` | | '_ \/ __|
"   | |_) | | |_| | (_| | | | | \__ \
"   | .__/|_|\__,_|\__, |_|_| |_|___/
"   |_|            |___/

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Plug 'vim-utils/vim-man'
"Plug 'kien/ctrlp.vim'
call plug#end()

"             _
"    ___  ___| |_ ___
"   / __|/ _ \ __/ __|
"   \__ \  __/ |_\__ \
"   |___/\___|\__|___/

syntax on
filetype plugin on

set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set noerrorbells
set guicursor=
"set nohlsearch
set hidden
set smartindent
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=8
set completeopt=menuone
set signcolumn=yes
set colorcolumn=120
set undodir=~/.config/nvim/undodir
set undofile
set noshowmode
set nowrap

"Split configurations
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


colorscheme gruvbox
highlight Normal guibg=none
let g:lightline = {
	\'colorscheme':'gruvbox',
	\}

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

"Clears the search, clearing its highlights
nnoremap <leader>/ :let @/ =""<CR>

"Split vertically or horizontally
nnoremap <leader>sv <C-w>v
noremap <leader>sh <C-w>s

"Automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


"   =======================
"    Plugin Configurations
"   =======================

"    Vim-Closetag settings
" =============================


"    emmet-vim settings
" =============================
" Remap the default emmet leader (To trigger, use <C-z> + ',')
let g:user_emmet_leader_key='<C-Z>'

"    nerdcommenter settings
" =============================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Toggle comment with <leader> + ;
nmap <leader>; <Plug>NERDCommenterToggle
vmap <leader>; <Plug>NERDCommenterToggle<CR>gv