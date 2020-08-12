" Settings {{{
syntax on
filetype indent on

set nocompatible                " no compatible with vi
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
set softtabstop=4
set shiftwidth=4
set autoindent
set copyindent
set shiftround
set expandtab

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
set wildignore=.svn,.hg,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc,node_modules,.tox

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

" move in wrap long lines is more intuitive
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Drop F1
nmap <F1> <nop>

let mapleader = ","
nmap <Leader><space> :noh<cr> " clean search highlight
nmap <Leader>b :AsyncRun -cwd=<root> -program=make @<cr> " running makeprg
nmap <Leader>t :AsyncRun grep -irn 'TODO:'<cr> " get TODO comment on project
noremap <Leader>q :call asyncrun#quickfix_toggle(8)<cr> " toggle quickfix
noremap <Leader>o :AsyncRun! xdg-open %<cr>

" Easily switch to directory of current file
map <Leader>cd :cd %:p:h<CR>

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

call plug#begin('~/.config/vim/plugged')

Plug 'gutierri/localset.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired' " remove
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'maralla/completor.vim'
Plug 'direnv/direnv.vim'
Plug 'blueyed/vim-diminactive'
Plug 'skywind3000/asyncrun.vim'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'logico/typewriter-vim'

call plug#end()

" }}}

" Colorscheme custom {{{

set t_Co=256
colorscheme typewriter

" }}}

" Filetypes {{{

augroup settingsfiletypes
    autocmd!
    autocmd FileType python setlocal textwidth=79 colorcolumn=79
    autocmd BufRead,BufNewFile *.{txt,md,rst} setlocal wrap textwidth=79 colorcolumn=79
    autocmd BufRead,BufNewFile *.{txt,md,rst} noremap <Leader>b :AsyncRun! pandoc --output $(VIM_FILENOEXT).pdf %:p<CR>

    autocmd BufEnter,BufRead,BufNewFile * silent! execute 'set path+='. FindRootDirectory() . '/**'

    autocmd BufRead,BufNewFile *.{py} nmap <Leader>r :AsyncRun -focus=0 -rows=8 -mode=terminal python3 %<cr>
augroup END

" }}}

" Plugins settings {{{

" vim/diminactive
let g:diminactive_use_syntax = 1 " use syntax disable on unactive window
let g:diminactive_use_colorcolumn = 0 " disable use of colorcolumn in unactive windows

" airblade/rooter
let g:rooter_manual_only = 1 " disable auto root directory insert on set path vim

" skywind3000/asyncrun.vim
let g:asyncrun_open = 7 " height quickfix run asyncrun command

" majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>

" maralla/completor.vim
let g:completor_python_binary = 'python3'

" }}}

" custom commands {{{

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" }}}

" status line {{{

set statusline=
set statusline+=\ [%{winnr()}] " number current buffer on window
set statusline+=\ %*
set statusline+=\ %F " absolute path current file
set statusline+=\ %=
set statusline+=\ %l:%c/%p%% " line,column and percent cursor current

" }}}
