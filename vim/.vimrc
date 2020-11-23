"source /apollo/env/envImprovement/var/vimrc

call plug#begin('~/.vim/bundle/')
" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'

" Status Bar
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/taglist.vim'
Plug '~/.fzf'
call plug#end()

" Standard vim options
set backspace=2           " allow backspacing over everything in insert mode
set ignorecase            " Do case insensitive matching
set incsearch             " Incremental search
set laststatus=2          " always have status bar
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " disable folds
set ruler                 " the ruler on the bottom is useful
set softtabstop=4         " Why are tabs so big?  This fixes it
" set textwidth=80          " This wraps a line with a break when you reach 80 chars
set expandtab
set tabstop=4
set shiftwidth=4
set lcs=trail:·
set list
set number
set hlsearch
set mouse=a
syntax on

"set background=dark
"let g:gruvbox_italic=1
"let g:gruvbox_invert_signs=0
"let g:gruvbox_improved_strings=0
"let g:gruvbox_improved_warnings=1
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_contrast_light="hard"
"colorscheme gruvbox

" Unified color scheme (dark: 233, light: 252)
" let g:seoul256_background = 233
let g:seoul256_background = 252
colo seoul256

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ },
      \ 'colorscheme': 'seoul256',
      \ }
 
" Show full path of filename
function! FilenameForLightline()
        return expand('%')
endfunction

"colorscheme inkstained

" Key mapping
let mapleader = "\<Space>"
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e<CR>
inoremap jj <ESC>
nnoremap <Leader>h :noh<CR>

command WQ wq
command Wq wq
command Wa wa
command WA wa
command W w
command Q q
command Qa qa

" Remove trailing whitespace
nnoremap <leader>t :%s/\s\+$//e<CR>

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

":Dox
":DoxAuthor
":DoxLic
let g:DoxygenToolkit_commentType="C"
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param[in,out]  "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_authorName="Bruno Roy"
let g:DoxygenToolkit_licenseTag="-*- mode: C++; c-basic-offset: 4; tab-width: 8; -*- \<enter>
                               \ vi: set shiftwidth=4 tabstop=8 expandtab: \<enter>
                               \ :indentSize=4:tabSize=8: \<enter>
                               \ \<enter> "
let g:DoxygenToolkit_briefTag_funcName = "yes"


" Rainbow vim
"let g:rainbow_active = 1

" TList open only one file
let Tlist_Show_One_File = 1
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format=1
"maps to close, and open list window
nnoremap <Leader>l :TlistOpen<CR>
nnoremap <Leader>c :TlistClose<CR>

" Open the fuzzy finder
nnoremap <Leader>f :FZF<CR>




let @a='o// XXX: [brunoroy]: '
let @b='O// XXX: [brunoroy]: '
nnoremap <Leader>b @a
nnoremap <Leader>B @b







" WHAT FOLLOWS IS FOR COC

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
