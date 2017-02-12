# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start Screen
[[ -z "$STY" ]] && screen -R default

export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"

# Change folder default of VIM (change to XDG)
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'

# Sets
shopt -s cdspell

# Call files of bash_utils folder
if [ -d "$HOME/.bash_utils" ]; then
    for file in "$HOME/.bash_utils/"*; do
        if [ -f "$file" ]; then
            source $file
        fi
    done
fi

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

