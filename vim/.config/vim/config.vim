" Settings {{{
syntax off
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
set wildignore=.svn,.hg,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc

"}}}

" Settings Backup and change folders {{{

silent !mkdir -p ~/.config/vim/{backup,swap,undo}/
silent !mkdir -p ~/.cache/vim/
set backup writebackup undofile
set undodir=~/.config/vim/undo//
set backupdir=~/.config/vim/backup//
set directory=~/.config/vim/swap//
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

" }}}

" Location default settings {{{

let &runtimepath.=',~/.config/vim,~/.config/vim/after'
let &packpath.=',~/.config/vim,~/.config/vim/after'

"}}}

" Colorscheme custom {{{

hi Normal   ctermfg=white ctermbg=black
hi Visual   ctermfg=black ctermbg=white

" }}}

" Filetypes {{{

augroup settingsfiletypes
    autocmd!
    autocmd BufRead,BufNewFile *.{txt,md} setlocal wrap
    autocmd BufRead,BufNewFile *.{py,coffee,txt,md} setlocal textwidth=79 colorcolumn=79
    autocmd BufRead,BufNewFile .bashrc,*.sh setlocal noexpandtab
    autocmd FileType go setlocal noexpandtab noshiftround tabstop=8 softtabstop=8 shiftwidth=8
    autocmd BufRead,BufNewFile Dockerfile setlocal noexpandtab
    autocmd BufRead,BufNewFile Makefile setlocal noexpandtab noshiftround tabstop=8 softtabstop=8 shiftwidth=8
    autocmd BufRead,BufNewFile *.{coffee,yml} setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" }}}

" Extra {{{
" GoLang Lint
set runtimepath+=$GOPATH/src/github.com/golang/lint/mist/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

"}}}
