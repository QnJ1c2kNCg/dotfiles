call plug#begin('~/.config/nvim/plugged')

" Misc
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'

call plug#end()

" Normal Vim config
set expandtab
set shiftwidth=4
set lcs=trail:·,tab:»·
set list
set cursorline
set relativenumber
set number
set mouse=a


set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e<CR>
inoremap jj <ESC>

" Use tabs instead of spaces
set autoindent noexpandtab tabstop=4 shiftwidth=4
