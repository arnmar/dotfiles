"--------------------------------------------------------------------------
"" General settings
"--------------------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set list
set listchars=tab:▸\ ,trail:·
" Easier save
nnoremap <c-s> :w<cr>
set list
set listchars=tab:▸\ ,trail:·

set number
set relativenumber
set ignorecase
set smartcase
set wildmode=longest:full,full
set spell
set termguicolors

"--------------------------------------------------------------------------
"" Key maps
"--------------------------------------------------------------------------

let mapleader = ','
inoremap jj <esc>
nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
nnoremap <silent> <leader>1 :source $MYVIMRC \| :PlugInstall<cr>

"--------------------------------------------------------------------------
"" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"--------------------------------------------------------------------------
"" Colors
"--------------------------------------------------------------------------

colorscheme gruvbox

"--------------------------------------------------------------------------
"" Plugin config
"--------------------------------------------------------------------------

" NerdTree
let NERDTreeShowHidden=1

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'gruvbox'

" fzf
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>

" floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'


