call plug#begin('~/.vim/bundle/')

Plug 'ajmwagar/vim-deus'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'

call plug#end()

" Normal Vim config
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set lcs=trail:~
set list
set number
set hlsearch
set backspace=indent,eol,start

set noswapfile
set nobackup
set nowritebackup
if !&diff
    set undodir=~/.vim/undodir
    set undofile
endif

colorscheme deus
set laststatus=2

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" gVim specific
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Airline stuff
set encoding=utf-8
let g:airline_powerline_fonts = 1
set guifont=Fira_Mono_for_Powerline:h12

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e<CR>
