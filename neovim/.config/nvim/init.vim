" Settings {{{
syntax on
filetype plugin indent on

set number                      " show line numbers
set showcmd                     " show position cursor
set laststatus=1                " status bar no bar
set ruler                       " position cursor
set cursorline                  " Highlight current line
set title                       " Show the filename on window title
set nowrap                      " Do not wrap lines

set splitbelow                  " New split goes below
set splitright                  " New split goes right

set clipboard+=unnamedplus      " Enable clipboard system

" Settings indentation style default
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set copyindent
set smartindent
set preserveindent

set list listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▸\ " Enable views end lines, tabs and long lines

" Disables arrow keys and mouse
set mouse=

map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
imap <UP> <NOP>
imap <DOWN> <NOP>
imap <LEFT> <NOP>
imap <RIGHT> <NOP>

" Settings search

" Ignore files
set wildignore=.svn,.hg,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc

" Colorscheme
set background=light " Background light
colorscheme off      " Colorscheme

" }}}

" Functions {{{ }}}

" Filetypes {{{ }}}

" Plugins {{{

call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

" }}}
