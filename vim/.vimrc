" Normal Vim config
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set lcs=trail:~
set list
set number
set hlsearch

set noswapfile
set nobackup
set nowritebackup
if !&diff
    set undodir=~/.nvim/undodir
    set undofile
endif

colorscheme elflord
set laststatus=2

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e<CR>
