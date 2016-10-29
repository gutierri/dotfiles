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

set foldmethod=marker                  " Enable folder marker
set autochdir                   " Current directory of file

" Settings indentation style default
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
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

" Settings Backup {{{

set backup writebackup
set undofile
set undodir=~/.config/vim/undo//
set backupdir=~/.config/vim/backup//
set directory=~/.config/vim/swap//

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

" Folder settings {{{

let &runtimepath.=',~/.config/vim,~/.config/vim/after'
let &packpath.=',~/.config/vim,~/.config/vim/after'

"}}}

" Colorscheme custom {{{

hi Normal   ctermfg=white ctermbg=black
hi Visual   ctermfg=black ctermbg=white

" }}}

" Plugins settings {{{

" GOYO.VIM
function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" }}}

" Filetypes {{{

augroup settingsfiletypes
    autocmd!
    autocmd BufRead,BufNewFile *.{txt,md} setlocal wrap textwidth=79 colorcolumn=79
    autocmd VimEnter *.{txt,md} Goyo
augroup END

" }}}
