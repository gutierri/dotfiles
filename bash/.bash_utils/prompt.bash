#!/usr/bin/bash

git_status() {
    if git status 2> /dev/null | grep -q 'Changes to be committe'; then
        echo -ne "●"
    fi
    if git status 2> /dev/null | grep -q 'Changes not staged for commit'; then
        echo -ne "■"
    fi
    if git status 2> /dev/null | grep -q 'Untracked files'; then
        echo -ne "▲"
    fi
    if git status 2> /dev/null | grep -q 'nothing to commit'; then
        echo -ne "-"
    fi
}

if [ -z $STY ]
then
    PS1=''
else
    PS1='(screen) '
fi

PS1+='\u \[\e[1;91m\]at\[\e[0m\] \h \[\e[1;91m\]in\[\e[0m\] \W '
PS1+='$(__git_ps1 "\[\e[1;91m\]on\[\e[0m\] git:%s($(git_status))")'
PS1+='\n% '
PS2='... '
export PS1
export PS2
