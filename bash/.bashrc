# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="nvim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"

source ~/.bash_utils/alias.bash
source ~/.bash_utils/prompt.bash

if [ -d "$HOME/.bin" ]; then
    PATH="$PATH:$HOME/.bin"
fi
