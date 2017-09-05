# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'
export SCREENRC="${HOME}/.config/screen/screenrc"
export PROMPT_COMMAND='history -a'

# Start Screen
if [ -z "$STY" ]; then
	if screen -ls | grep -i work > /dev/null 2>&1; then
		echo "Work session it's running..."
	else
		screen -S WORK
	fi
fi

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
				if [ -f "$private_files" ]; then
					source "${private_files}"
				fi
			done
		fi
	done
fi
