#!/usr/bin/env bash

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
alias screen-killall='screen -ls | grep -ioP "^\t.+?\." | sed -s "s/\t//g;s/\.//g" | xargs kill'
alias zz='funcoeszz'
alias todo=todo.sh
