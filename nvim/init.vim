call plug#begin('~/.config/nvim/plugged')

" Misc
Plug 'airblade/vim-gitgutter'   " Git
Plug 'plasticboy/vim-markdown'  " Markdown
Plug 'scrooloose/nerdtree'      " Tree explorer
Plug 'tpope/vim-commentary'     " Comment stuff
Plug 'ctrlpvim/ctrlp.vim'       " File fuzzy finder

" UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'     " For C++
Plug 'rust-lang/rust.vim'       " For Rust

call plug#end()

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang'
set completeopt-=preview

" Misc config
let g:gitgutter_sign_column_always = 1

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

" NERDTree config
noremap <C-n> :NERDTreeToggle<CR>

" Normal Vim config
set expandtab
set shiftwidth=4
set lcs=trail:·,tab:»·
set list
set cursorline
set relativenumber
set number

set noswapfile
set nobackup
set nowritebackup
if !&diff
    set undodir=~/.nvim/undodir
    set undofile
endif

" UI config
let g:airline_powerline_fonts=1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

set background=dark
let g:gruvbox_contrast_light="hard"
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=0
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

set laststatus=2

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
