#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# Alias
source ~/.bash_utils/aliases.bash

# Git
source ~/.bash_utils/git-status.bash
source ~/.bash_utils/git-completion.bash

# BIN Path
if [ -d "$HOME/.bin" ]; then
    PATH="$PATH:$HOME/.bin"
fi

if [ -d "$HOME/.gem/ruby/2.2.0/bin" ]; then
    PATH="$PATH:$HOME/.gem/ruby/2.2.0/bin"
fi

PS1='\[\e[0;36m\]\W \[\e[01;31m\]$(git_branch_or_tag)\[\e[0;33m\]$(git_status) \[\e[0;32m\]% \[\e[0m\]'
