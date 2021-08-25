syntax on
filetype indent on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set number
set nowrap
set noswapfile
set incsearch
set wildmode=longest,list,full
set splitbelow splitright
set cursorline

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader=" "

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'fatih/vim-go'

call plug#end()

" Vim Airline configuration
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"
" Goyo config
"
map <leader>f :Goyo \| set linebreak<CR>


"
" NERDTree config
"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

colorscheme gruvbox
set background=dark

" Global key mappings
imap ii <Esc>
nnoremap <leader>+v :vertical resize +5<CR>
nnoremap <leader>-v :vertical resize -5<CR>
nnoremap <leader>+s :resize +5<CR>
nnoremap <leader>-s :resize -5<CR>

"
" Terminal Emulator config
"
" Esc to exit terinal mode
tnoremap <Esc> <C-\><C-n>
" navigation between windows
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
" No line numbers
au TermOpen * set nonumber

" External files
source ~/.config/nvim/lspconfig.vim
