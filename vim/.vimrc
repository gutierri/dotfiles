" Settings {{{

set nocompatible                " no compatible with vi

filetype plugin indent on

set relativenumber              " enable relative number lines
set nonumber                    " hide line numbers
set showcmd                     " show command bottom
set laststatus=2                " status bar no bar
set ruler                       " position cursor
set title                       " Show the filename on window title
set nowrap                      " Do not wrap lines
set wildmenu                    " Visual complete command menu
set lazyredraw                  " redraw only
set showmatch                   " highlight [({<>})]
set cursorline

set splitbelow                  " New split goes below
set splitright                  " New split goes right

set foldmethod=manual           " Enable folder marker
set autochdir                   " Current directory of file

" Settings indentation style default
set tabstop=4
set copyindent
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop=4          " Tab key indents by 4 spaces.
set shiftwidth=4           " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set formatoptions-=o "dont continue comments when pushing /O
set showbreak=↪\ 
set list listchars=trail:•,nbsp:␣,precedes:«,extends:»,eol:¬,tab:▶\ " Enable views end lines, tabs and long lines

" Disable support mouse
set mouse=

" Settings search
set ignorecase
set hlsearch
set incsearch " enable highlight on typing for substitute % s///g >= patch 8.1.0271

" Ignore files
set wildignore+=.svn,.hg,.git
set wildignore+=*.o,*.a,*.class
set wildignore+=*.mo,*.la,*.so
set wildignore+=*.obj,*.swp,*.jpg
set wildignore+=*.png,*.xpm,*.gif
set wildignore+=*.pdf,*.bak,*.beam
set wildignore+=*.pyc,node_modules,.tox,.venv,.env

"}}}

" Settings Backup and change folders {{{

silent !mkdir -p ~/.cache/vim/{swap,backup,undo}

set backup writebackup undofile
set undodir=~/.cache/vim/undo//
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//

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
nmap <F9> o<Esc>
nmap <F8> O<Esc>

" Drop F1
nmap <F1> <nop>

let mapleader = ","
nmap <Leader><space> :noh<cr> " clean search highlight
nmap <Leader>b :AsyncRun -cwd=<root> -program=make @<cr> " running makeprg
nmap <Leader>t :AsyncRun grep -irn 'TODO:'<cr> " get TODO comment on project
noremap <Leader>q :call asyncrun#quickfix_toggle(8)<cr> " toggle quickfix
noremap <Leader>o :AsyncRun! xdg-open %<cr>
noremap <Leader>r :AsyncRun -raw python3 %<cr>
noremap <Leader>s :update<cr>

noremap <F10> :AsyncRun! -cwd=<root> ctags -R .<cr>

" Easily switch to directory of current file
map <Leader>cd :cd %:p:h<CR>

" windows/split manager
nmap <C-W><bar> :call feedkeys(":vsplit \<Tab>", 'tn')<CR>
nmap <C-W>S :call feedkeys(":split \<Tab>", 'tn')<CR>

" }}}

" Location default settings {{{

let &runtimepath.=',~/.config/vim,~/.config/vim/after'

"}}}

" Plugins {{{

if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.cache/vim/plugged')

Plug 'tpope/vim-rsi'
Plug 'direnv/direnv.vim'
Plug 'blueyed/vim-diminactive'
Plug 'skywind3000/asyncrun.vim'
Plug 'majutsushi/tagbar'
Plug 'gutierri/localset.vim'

call plug#end()

" }}}

" setups&IDE likes {{{

" setup paths and ctags root project
augroup setup_paths
    autocmd!
    " set root project dir on path
    autocmd BufEnter,BufRead,BufNewFile * silent! execute 'set path+='. asyncrun#get_root('.%.') . '/**'

    " set ctags files path
    autocmd BufEnter,BufRead,BufNewFile * silent! execute 'set tags+='. asyncrun#get_root('.%.') . '/tags'
augroup end

" tips&tricks from help AsyncRun
augroup local-asyncrun
    au!
    au User AsyncRunStop copen | wincmd p
augroup END

augroup pythonsetups
    autocmd!
    autocmd BufRead,BufNewFile *.py setlocal textwidth=79 colorcolumn=79
augroup END

" }}}

" Plugins settings {{{

" vim/diminactive
let g:diminactive_use_syntax = 1        " use syntax disable on unactive window
let g:diminactive_use_colorcolumn = 1   " disable use of colorcolumn in unactive windows

" skywind3000/asyncrun.vim
let g:asyncrun_open = 7                 " height quickfix run asyncrun command

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" }}}

" custom commands {{{

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" }}}

" status line {{{

set statusline=
set statusline+=\ [%{winnr()}] " number current buffer on window
set statusline+=\ %<           " not hidden when without space on screen
set statusline+=\ %F           " absolute path current file
set statusline+=\ %=
set statusline+=\ %l:%c/%p%%   " line,column and percent cursor current

" }}}
