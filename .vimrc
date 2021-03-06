"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

filetype plugin on
filetype indent on

" Auto read when file is changed from the outside
set autoread

" Auto source vimrc when changed
" autocmd bufwritepost $MYVIMRC source $MYVIMRC 

let mapleader=","

" Auto source .vimrc when saved
au! BufWritePost .vimrc source %

au BufNewFile,BufRead Jenkinsfile setf groovy
 
"Airline
let g:airline_powerline_fonts = 1
set encoding=utf-8

let g:ctrlp_show_hidden = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'valloric/youcompleteme.git'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'
Plugin 'alepez/vim-gtest'
Plugin 'justinmk/vim-sneak'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'easymotion/vim-easymotion'

call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""t
nnoremap ö ,
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
if &term != 'linux' && !has('gui_running')
  set t_Co=256 "256 colors
  set term=xterm
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme zenburn
"colorscheme skittles_berry
"colorscheme solarized
"set background=light

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup
set nowb
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GTest
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gtest#highlight_failing_tests = 1
augroup GTest
autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END

nnoremap <F7> :Make<CR>

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

nnoremap <F5> : call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'python'
        exec "Dispatch python %"
    endif
endfunction

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

:highlight ExtraWhitespace ctermbg=red guibg=red
:set list
:match ExtraWhitespace /\s\+$/
set listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

map <leader>bd :Bclose<cr>

map <leader>mt :!make test<cr>:!./test<cr>

"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O

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

fun! TrimTrailingWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_cmd = 'CtrlPMRU'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MinibufExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplAutoStart = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <F11> :YcmCompleter GetDoc<CR>

"
" Remove search highlighting
map <leader><space> :noh<cr>

nnoremap ö ;
nnoremap Ö ,

" Easier save
nnoremap <c-s> :w<cr>
nnoremap <leader>w :w<cr>

" Move a line of text using alt+jk
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`zz

nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Diffs
nnoremap <leader>< ]c
nnoremap <leader>> [c
nnoremap <M-Down> ]c
nnoremap <M-Up> [c
nnoremap <M-Left> do
nnoremap <M-Right> dp

nmap <silent> <leader>s :FSHere<cr>
nmap <silent> <leader>S :FSSplitRight<cr>
