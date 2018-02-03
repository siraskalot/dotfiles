"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.

set nocompatible


" ================ Vundle ====================

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles on github
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shutnik/jshint2.vim'
Bundle 'sjl/vitality.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
"Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdcommenter'
" Bundle 'editorconfig/editorconfig-vim'
Bundle 'vim-airline/vim-airline'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on     " required!


" ================ Bundle Settings ====================

map <C-n> :NERDTreeToggle<CR>


" ================ General Config ====================

set relativenumber              " Faster vim commands, with relative line numbers
set number                      " This turns on hybrid line number mode
set ruler                       " Show row, column in status-bar
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set nowrap                      " Do not wrap lines by default


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab     " Insert space characters whenever the tab key is pressed
set tabstop=2     " Control the number of space characters that will be inserted when the tab key is pressed
set shiftwidth=2  " Change the number of space characters inserted for indentation using `shift + >` or `shift + <`
set softtabstop=2 " Let backspace delete spaces the same width as tabstop

" ================ Show invisible characters ======================

set list

set listchars=""
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=tab:▸\ 
"set listchars+=eol:¬

" Toggle `set list`
nmap <leader>l :set list!<CR>


" ================ Syntax highlighting ======================

syntax on

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.scss set ft=scss.css
autocmd BufNewFile,BufRead *.bowerrc set ft=json
autocmd BufNewFile,BufRead *.jshintrc set ft=json
autocmd BufNewFile,BufRead *.ejs set ft=html

" ================ Change key mappings ======================

" Use jj to get out of insert mode
:imap jj <Esc>
set pastetoggle=<F2>          " Toggle `set paste`
let mapleader = ','

" Better CSS autocompletion
inoremap <leader>, <C-x><C-o>;<Left>


" ================ Auto-close braces ======================

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"


" ================ Better splits ======================

" remap ctrl+w to ctrl+h/j/k/l
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" split more naturally
set splitbelow
set splitright


" ================ Colors ======================

set t_Co=256                    " iTerm 2 displays colours now!
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1       " Fixes vim transparency issue in iTerm 2
colorscheme solarized


" ================ Save when focus is lost ======================

:au FocusLost * :wa

" ================ Disable arrows ======================

"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>
"
"inoremap <BS> <Nop>
"inoremap <Del> <Nop>

"open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

"open a NERDTree automatically when vim starts up if no files were specified?
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"xml autocomplete plugin
let g:ragtag_global_maps = 1


"To quickly resize windows with a vertical split
:map - <C-W>-
:map + <C-W>+

"To resize vertical windows quickly with ALT-SHIFT-[<>]
:map <M-<> <C-W><
:map <M->> <C-W>>


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


imap <Tab> <C-P>


" airline
set laststatus=2


" indent whole file
map <leader>i mmgg=G`m

" setpaste
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>






" 2018-01 ---

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

set nocompatible

" ================ General Config ====================

set relativenumber              " Faster vim commands, with relative line numbers
set number                      " This turns on hybrid line number mode
set ruler                       " Show row, column in status-bar
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set nowrap                      " Do not wrap lines by default


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab     " Insert space characters whenever the tab key is pressed
set tabstop=2     " Control the number of space characters that will be inserted when the tab key is pressed
set shiftwidth=2  " Change the number of space characters inserted for indentation using `shift + >` or `shift + <`
set softtabstop=2 " Let backspace delete spaces the same width as tabstop

" ================ Show invisible characters ======================

set list

set listchars=""
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=tab:▸\ 
"set listchars+=eol:¬

" Toggle `set list`
nmap <leader>l :set list!<CR>


" ================ vim-plug  ======================
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized', { 'set': 'all' }
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'

call plug#end()

" ================ Syntax highlighting ======================

"syntax on
syntax enable
filetype plugin on
set background=dark
colorscheme solarized

" ================ Airline ======================
set laststatus=2

" ================ Reach for Esc less  ======================
:imap jj <Esc>

" ================ Indent document the stay on same line  ======================
map <Leader>i mmgg=G`m

" ================ Paste from system clipboard at current indent level without
" breaking indentation ======================
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<CR>

" ================ Toggle off relativenumber in insert mode  ======================
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set relativenumber

