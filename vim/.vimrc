call plug#begin('~/.vim/bundle/')
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
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
syntax on

set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

"colorscheme inkstained

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e<CR>
inoremap jj <ESC>

command WQ wq
command Wq wq
command Wa wa
command WA wa
command W w
command Q q



" Remove trailing whitespace
nnoremap <leader>t :%s/\s\+$//e<CR>


" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
