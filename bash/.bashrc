# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start Screen
[[ -z "$STY" ]] && screen -d -RR -c ~/.config/screen/screenrc

# Exports
export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'

PATH=$PATH:$HOME/.local/bin

# Sets
shopt -s cdspell

# Call Scripts
if [ -d "$HOME/.bash_utils" ]; then
    for file in "$HOME/.bash_utils/"*; do
        if [ -f "$file" ]; then
            source "${file}"
        elif [ -d ${file} ]; then
            for private_files in "${file}/"*; do
                source "${private_files}"
            done
        fi
    done
fi
