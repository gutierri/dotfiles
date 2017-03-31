# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start Screen
[[ -z "$STY" ]] && screen -R default

# Exports
export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'

PATH=$PATH:$HOME/.local/bin

# Sets
shopt -s cdspell

# Call scripts
source /usr/share/git/completion/git-prompt.sh

# Alias
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
alias aur='yaourt'
alias refresh='source ~/.bashrc'

# Prompt

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
PS1='\u \[\e[1;91m\]at\[\e[0m\] \h \[\e[1;91m\]in\[\e[0m\] \W$(__git_ps1 " \[\e[1;91m\]on\[\e[0m\] git:%s")\n% '
PS2='... '
