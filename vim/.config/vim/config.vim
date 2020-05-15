" Settings {{{
syntax on
filetype indent on

set nocompatible                " no compatible with vi
set nonumber                    " hide line numbers
set showcmd                     " show command bottom
set laststatus=1                " status bar no bar
set ruler                       " position cursor
set title                       " Show the filename on window title
set nowrap                      " Do not wrap lines
set wildmenu                    " Visual complete command menu
set lazyredraw                  " redraw only
set showmatch                   " highlight [({<>})]

set splitbelow                  " New split goes below
set splitright                  " New split goes right

set foldmethod=manual           " Enable folder marker
set autochdir                   " Current directory of file

" Settings indentation style default
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set shiftround
set expandtab

set list listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▶\ " Enable views end lines, tabs and long lines

" Disable support mouse
set mouse=

" Settings search
set ignorecase
set hlsearch

" Ignore files
set wildignore=.svn,.hg,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc,node_modules

set shellpipe+=\ " fixs output quickfix with :Make on dispatch
"}}}

" Settings Backup and change folders {{{
silent !mkdir -p ~/.cache/vim/{swap,backup,undo}

set backup writebackup undofile
set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//

let viminfopath="~/.cache/vim/viminfo"
let &viminfo .= ',n' . escape(viminfopath, ',')
" }}}

" Maps {{{

" Disable arrow keys
map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
imap <UP> <NOP>
imap <DOWN> <NOP>
imap <LEFT> <NOP>
imap <RIGHT> <NOP>

" Breakline on NORMAL mode
nmap <F8> o<Esc>
nmap <F9> O<Esc>

" Drop F1
nmap <F1> <nop>

let mapleader = ","
nmap <Leader><space> :noh<cr> " clean search highlight
nmap <Leader>b :Make!<cr> " running build with makeprg default option via Dispatch
nmap <Leader>t :Dispatch grep --exclude-dir='node_modules' -irn 'TODO:'<cr> " get TODO comment on project
nmap <F5> :@:<cr> " running last command

" }}}

" Location default settings {{{

let &runtimepath.=',~/.config/vim,~/.config/vim/after'
let &packpath.=',~/.config/vim,~/.config/vim/after'

"}}}

" Plugins {{{

if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/vim/plugged')

Plug 'gutierri/localset.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'maralla/completor.vim'
Plug 'direnv/direnv.vim'
Plug 'blueyed/vim-diminactive'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" }}}

" Colorscheme custom {{{

colorscheme default

" }}}

" Filetypes {{{

augroup settingsfiletypes
    autocmd!
    autocmd FileType python setlocal textwidth=79 colorcolumn=79
    autocmd BufRead,BufNewFile *.{txt,md,rst} setlocal wrap textwidth=79 colorcolumn=79
    autocmd BufEnter,BufRead,BufNewFile * silent! execute 'set path+='. FindRootDirectory() . '/**'
augroup END

" }}}

" Plugins settings {{{

" vim/diminactive
let g:diminactive_use_syntax = 1
let g:diminactive_use_colorcolumn = 0

" airblade/rooter
let g:rooter_manual_only = 1

" }}}
