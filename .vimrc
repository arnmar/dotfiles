"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

filetype plugin on
filetype indent on

set guifont=Lucida_Console:h9

" Auto read when file is changed from the outside
set autoread

" Auto source vimrc when changed
" autocmd bufwritepost $MYVIMRC source $MYVIMRC 

let mapleader="\<Space>"

" Auto source .vimrc when saved
au! BufWritePost .vimrc source %
 
"Airline
let g:airline_powerline_fonts = 1

let g:ctrlp_show_hidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree.git'
"Plugin 'valloric/youcompleteme.git'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdcommenter.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'terryma/vim-smooth-scroll'

call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""t
nnoremap Ã¶ ,
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler

set cursorline

set wildmenu
set wildignore=*.o
set wildmode=list:longest,full

set cmdheight=2

set hid

set ignorecase
set smartcase
set hlsearch
set incsearch

set number

set laststatus=2 "Always show the statusbar
if &term != 'linux'
  set t_Co=256 "256 colors
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
colorscheme molokai
"colorscheme skittles_berry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Smooth scroll plugin mappingSmooth scroll plugin mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai
set si
set nowrap

autocmd FileType make setlocal noexpandtab

noremap <leader><leader> <C-^>
" Map jj for easier escape 
inoremap jj <esc>

nnoremap <leader>/ :1,$ s//gc<Left><Left><Left>

" Remove search highlighting
map <leader><space> :noh<cr>

nnoremap Ã¶ ;
nnoremap Ã– ,

" Easier save
nnoremap <c-s> :w<cr>
nnoremap <leader>w :w<cr>

noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Move a line of text using alt+jk
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`zz

" Fuzzy finder mappings
nnoremap <silent> <leader>b :FufBuffer<CR>
nnoremap <silent> <leader>f :FufFile<CR>
nnoremap <silent> <leader>t :FufCoverageFile<CR>

nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Diffs
nnoremap <leader>< ]c
nnoremap <leader>> [c
nnoremap <M-Down> ]c
nnoremap <M-Up> [c
nnoremap <M-Left> do
nnoremap <M-Right> dp


function! SwitchSourceHeader()
    if (expand ("%:e") == "cpp")
        find %:t:r.h
    else
        find %:t:r.cpp
    endif
endfunction

nmap <leader>s :call SwitchSourceHeader()<CR>

function! ToggleBoolean()
    let match_true = search("true", "n", line(".")) 
    let match_false = search("false", "n", line(".")) 
    if (match_true > 0)
        let a = search("true", "", line(".")) 
        :normal cwfalse
    endif
    if (match_false > 0)
        let a = search("false", "", line(".")) 
        :normal cwtrue
    endif
endfunction

nmap <leader>t :call ToggleBoolean()<CR>

nnoremap <leader>gt :find **/%:t:rTests.cpp<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clang_complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:clang_auto_select=1
"let g:clang_complete_auto=0
"let g:clang_complete_copen=1
"let g:clang_hl_errors=1
"let g:clang_periodic_quickfix=0
let g:clang_snippets=1
"let g:clang_snippets_engine="clang_complete"
"let g:clang_snippets_engine="snipmate"
let g:clang_conceal_snippets=0
"let g:clang_exec="clang"
"let g:clang_user_options=""
"let g:clang_auto_user_options="path, .clang_complete"
"let g:clang_use_library=1
"let g:clang_library_path="/directory/of/libclang.so/"
"let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
let g:clang_trailing_placeholder=1
let g:clang_close_preview=1

<<<<<<< HEAD
set listchars=trail:·,tab:»·
nmap <silent> <leader>s :set nolist!<CR>
=======
set listchars=tab:>-,trail:Â·
"nmap <silent> <leader>s :set nolist!<CR>
>>>>>>> Changed leader and added function for header toggle

map <leader>bd :Bclose<cr>

map <leader>mt :!make test<cr>:!./test<cr>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O

noremap <silent> <C-Tab> :A<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

