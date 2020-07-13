# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# exports
export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'
export SCREENRC="${HOME}/.config/screen/screenrc"
export PROMPT_COMMAND='history -a'
export PAGER=less
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
export PATH=$PATH:$HOME/.local/bin

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=10000000
PROMPT_COMMAND="history -a; history -n" # append and reload the history after each command
HISTIGNORE='ls:ll:cd:pwd:bg:fg:history'

# sets and options bash
set -o noclobber
set -o notify
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s hostcomplete
shopt -s lithist

# alias
alias ls='ls -F -v'
alias ll='ls -laF --group-directories-first -v'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias targz='tar -zxvf'
alias e='vim'
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'
alias refresh='source ~/.bashrc'
alias screen-killall='screen -ls | grep -ioP "^\t.+?\." | sed -s "s/\t//g;s/\.//g" | xargs kill'
alias venv-py='python3.8 -m venv "$HOME/.cache/venvs/$(pwd | rev | cut -d / -f-1 | rev)" &&  echo "virtualenv created on ~> $HOME/.cache/venvs/$(pwd | rev | cut -d / -f-1 | rev)"'
alias g='git'

# plugins/utils/etc
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# from https://github.com/rupa/z
[ -f $HOME/.local/share/z/z.sh ] && source $HOME/.local/share/z/z.sh

# from https://asdf-vm.com
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && . $HOME/.asdf/completions/asdf.bash

# from https://direnv.net/
[ -x "$(command -v direnv)" ] && eval "$(direnv hook bash)"

# from https://github.com/gutierri/screen-workdir.sh
[ -f $HOME/.local/share/screen-workdir.sh/screen-workdir.sh ] && source ~/.local/share/screen-workdir.sh/screen-workdir.sh

show_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
        echo "(venv:$(basename $VIRTUAL_ENV)) "
    fi
}

PS1='$(show_virtual_env)\W$(__git_ps1 " \[\e[1;91m\]on\[\e[0m\] git:%s") % '
PS2='... '

if echo $TERM | grep ^screen -q
then
    PS1='\[\033k\033\\\]'$PS1
fi
