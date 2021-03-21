##### Table of Contents  
[Introduction](INSERIRLINK)  
[Basic init.vim](INSERIRLINK)  
[Sources](INSERIRLINK)  
----[Sets](INSERIRLINK)  
----[Remaps](INSERIRLINK)  
----[NERDCommenter](INSERIRLINK)  
----[Auto-Pairs](INSERIRLINK)  
----[LightLine](INSERIRLINK)  
----[Rainbow](INSERIRLINK)  
----[UltiSnips](INSERIRLINK)  
----[TreeSitter](INSERIRLINK)  
----[LSP-Config](INSERIRLINK)  
----[Compe](INSERIRLINK)  



# Introduction
This is a tutorial for future me on everything I did to configure my neovim the way I like and use today.  
It is broken down step-by-step, plugin-by-plugin.  
This tutorial contains only the configuration files. If you want a installation guide, check [this link](INSERIRLINK)

Note: I was using WSL2 when I created this config, so there may be some things that you don't need if you're using OSX or Linux.
***

# Basic init.vim
```
" INIT.VIM

let mapleader = " "

source $HOME/.config/nvim/configs/sets.vim
source $HOME/.config/nvim/configs/remaps.vim

" PLUGINS

call plug#begin('~/.config/nvim/plugged')
	" Test
	" Plug 'akinsho/nvim-bufferline.lua'
	" Plug 'kyazdani42/nvim-web-devicons'

	" Still aren't configured
	" Plug 'nvim-telescope/telescope.nvim'
	Plug 'mbbill/undotree'
	" Plug 'mattn/emmet-vim'
	" Plug 'metakirby5/codi.vim'

	" Configured, but I want to change something
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'justinmk/vim-sneak'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	Plug 'norcalli/nvim-colorizer.lua'

	" Already configured
	Plug 'jiangmiao/auto-pairs'
	Plug 'ryanoasis/vim-devicons'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'itchyny/lightline.vim'
	Plug 'luochen1990/rainbow'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

	" Colorscheme
	Plug 'beikome/cosme.vim'
	Plug 'morhetz/gruvbox'
	Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
	Plug 'mhartington/oceanic-next'
	Plug 'joshdick/onedark.vim'
call plug#end()

colorscheme onedark
highlight Normal guibg=none
let g:lightline = {
	\'colorscheme':'onedark',
	\}
lua require'colorizer'.setup()

"Automatically deletes all  trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


" SOURCES

source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/auto-pairs.vim
source $HOME/.config/nvim/plug-config/undotree.vim
source $HOME/.config/nvim/plug-config/lightline_powerful.vim
" source $HOME/.config/nvim/plug-config/emmet.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim
luafile $HOME/.config/nvim/plug-config/treesitter.lua
luafile $HOME/.config/nvim/plug-config/lsp-config.lua
luafile $HOME/.config/nvim/plug-config/compe.lua

let g:NERDCompactSexyComs = 0
```
---
# Sources
## sets.vim
```
syntax on
filetype plugin on

set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set noerrorbells
set guicursor=
set hidden
set smartindent
set incsearch
set ignorecase
set smartcase
set termguicolors
set scrolloff=8
set completeopt=menuone,noselect
set signcolumn=yes
set colorcolumn=120
set undodir=~/.config/nvim/undodir
set undofile
set noswapfile
set nobackup
set noshowode
set nowrap
set shortmess+=c

" Lightline - Always show tabline
set showtabline=2
```  
## remaps.vim
```
" =====================================================
" General
" =====================================================

" Clears the search, clearing its highlights
nnoremap <leader>/ :let @/ =""<CR>

" Window movement
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" =====================================================
" Compe
" =====================================================
" <Tab> to navigate on autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "<C-n>" : "<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-n>" : "<S-Tab>"

" =====================================================
" Lightline
" =====================================================
" Changing to a buffer by its ordinal number
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

" Deleting buffers by their ordinal number
nmap <leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <leader>c0 <Plug>lightline#bufferline#delete(10)

" =====================================================
" Nerdcommenter
" =====================================================
" Toggle comment with <leader> + ;
nmap <leader>; <Plug>NERDCommenterToggle
vmap <leader>; <Plug>NERDCommenterToggle<CR>gv

" =====================================================
" Nerdtree
" =====================================================
nnoremap <leader>n :NERDTreeFocus<CR>

" =====================================================
" Ultisnips
" =====================================================
" Ultisnips remaps are on its file, but are as following:
" Expand trigger:         <C-a>
" Jump forward trigger:   <C-x>
" Jump backwards trigger: <C-z>

" =====================================================
" Undotree
" =====================================================
nnoremap <leader>u :UndotreeToggle<CR>
```

## auto-pairs.vim
```
" Activate FlyMode
let g:AutoPairsFlyMode = 1

"AutoPairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}


" Defaults
" let g:AutoPairsShortcutBackInsert = '<M-b>'
"
" System Shortcuts:
    " <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
    " <BS>  : Delete brackets in pair
    " <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
    " <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
    " <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
    " <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

" If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add

    " let g:AutoPairsShortcutToggle = '<another key>'

" to .vimrc, if the key is empty string '', then the shortcut will be disabled.

```

## lightline_powerful.vim
```
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" Defines whether to add the buffer number to the buffer name. 2 means ordinal number
let g:lightline#bufferline#show_number = 2

" Enables the usage of vim-devicons
let g:lightline#bufferline#enable_devicons = 1


" I happened to come across this config, which is, APPARENTLY, the defaults,
" but I didn't have time to look into it, and when I tried to load it,
" my nvim broke for a reason. But here it is (I think the person who made it
" is the plugin author):

" =============================================================================
" Filename: plugin/lightline_powerful.vim
" Author: itchyny
" License: MIT License
" Last Change: 2021/02/15 01:04:08.
" =============================================================================

" if exists('g:loaded_lightline_powerful') || v:version < 800
"   finish
" endif
" let g:loaded_lightline_powerful = 1

" let g:lightline = extend(get(g:, 'lightline', {}), {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
"       \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'binary', 'fileformat', 'fileencoding', 'filetype' ] ]
"       \ },
"       \ 'inactive': {
"       \   'left': [ [ 'filename' ] ],
"       \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
"       \ },
"       \ 'tabline': {
"       \   'left': [ [ 'tabs' ] ],
"       \   'right': []
"       \ },
"       \ 'tab': {
"       \   'active': [ 'tabnum', 'readonly', 'filename', 'modified' ],
"       \   'inactive': [ 'tabnum', 'readonly', 'filename', 'modified' ]
"       \ },
"       \ 'component': {
"       \   'binary': '%{&binary?"binary":""}',
"       \   'lineinfo': '%3l:%-2c%<',
"       \ },
"       \ 'component_visible_condition': {
"       \   'binary': '&binary',
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'lightline_powerful#gitbranch',
"       \   'filename': 'lightline_powerful#filename',
"       \   'mode': 'lightline_powerful#mode',
"       \ },
"       \ 'component_function_visible_condition': {
"       \   'filename': 'get(b:,"lightline_filename","")!=#""',
"       \   'mode': '1',
"       \ },
"       \ 'tab_component_function': {
"       \   'filename': 'lightline_powerful#tabfilename',
"       \   'readonly': 'lightline_powerful#tabreadonly',
"       \ },
"       \ }, 'keep')
```

## nerdcommenter.vim
```
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Comment to the left instead of following identation
let g:NERDDefaultAlign = 'left'
```

## rainbow.vim
```
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'separately': {
\      'nerdtree': 0
\   }
\}
```

## ultisnips.vim
```
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-x>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
```

## compe.lua
```
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
	ultisnips = true;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end
```

## lsp-config.lua
```
-- setting up language servers
require'lspconfig'.clangd.setup{}

-- not tested yet
require'lspconfig'.html.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jsonls.setup{}
```

## treesitter.lua
```
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
```
