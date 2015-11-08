set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set number
set relativenumber
set nobackup
set nowritebackup
set noswapfile
set t_Co=256
set background=dark
set title
set lazyredraw
set showmatch
set showcmd
set ruler
set autoread
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set copyindent
set smartindent
set preserveindent
set cursorline cursorcolumn
set hlsearch
set laststatus=2
set nowrap
set wildmenu
set foldenable
set splitright

set list listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▸\

set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc

syntax on
filetype plugin indent on 

colorscheme gotham

let g:lightline = { 
    \ 'colorscheme': 'gotham',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
