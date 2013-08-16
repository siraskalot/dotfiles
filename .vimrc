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

filetype plugin indent on     " required!


" ================ Bundle Settings ====================

map <C-n> :NERDTreeToggle<CR>


" ================ General Config ====================

set relativenumber              "Faster vim commands, with relative line numbers
set ruler                       "Show row, column in status-bar
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb


" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set expandtab     "Insert space characters whenever the tab key is pressed
set tabstop=2     "Control the number of space characters that will be inserted when the tab key is pressed
set shiftwidth=2  "Change the number of space characters inserted for indentation
set softtabstop=2

" ================ Show invisible characters ======================

set list

set listchars=""
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
"set listchars+=eol:¬
"set listchars+=tab:▸\

"Toggle `set list`
nmap <leader>l :set list!<CR>


" ================ Syntax highlighting ======================

syntax on

autocmd BufNewFile,BufRead *.json set ft=javascript "Turn on syntax highlighting for json


" ================ Change key mappings ======================

"Use jj to get out of insert mode
:imap jj <Esc>
set pastetoggle=<F2>          "Toggle `set paste`


" ================ Auto-close braces ======================

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

