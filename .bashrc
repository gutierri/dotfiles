#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# GIT
git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
git_tag () {
    git describe --tags 2> /dev/null
}
git_branch_or_tag() {
    local OUT="$(git_branch)"
        if [ "$OUT" == "no branch" ]; then
        OUT="$(git_tag)";
    fi
    echo $OUT
}
git_status() {
    if git status 2> /dev/null | grep -q 'Changes to be committe'; then
        echo -ne "\e[01;32m ●\e[0m"
    fi
    if git status 2> /dev/null | grep -q 'Changes not staged for commit'; then
        echo -ne "\e[01;33m ▀\e[0m"
    fi
    if git status 2> /dev/null | grep -q 'Untracked files'; then
        echo -ne "\e[01;31m ▲\e[0m"
    fi
}

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"


# Sources

# Git Completion
source ~/.bash_utils/aliases.bash

# Git Completion
source ~/.bash_utils/git-completion.bash


# BIN Path
if [ -d "$HOME/.bin" ]; then
    PATH="$PATH:$HOME/.bin"
fi

PS1='\[\e[0;36m\]\W \[\e[0;32m\]% \[\e[0m\]'
