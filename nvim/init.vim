call plug#begin('~/.config/nvim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim'
call plug#end()

set number
set relativenumber
set background=dark

" Tabs / Indentation
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

filetype plugin indent on
syntax on
set ignorecase
set smartcase
set nobackup
set noswapfile
set incsearch
set tabstop=4
" Mappings
imap ii <Esc>

" Airline
let g:airline#extension#tabline#enabled = 1
let g:airline_solarized_bg='dark'
