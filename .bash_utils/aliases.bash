#!/bin/bash

alias ls='ls --color=auto -F'
alias ll='ls -laF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias sudovim='sudo -E vim'
alias targz='tar -zxvf'
alias targz='tar -vzxf'
alias tarbz2='tar -jxvf'
alias fontcache='fc-cache -f $HOME/.fonts'
alias here='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Syu'
alias search='sudo pacman -Ss'
