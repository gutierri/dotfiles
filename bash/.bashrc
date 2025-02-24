# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# exports
export EDITOR="vim"
export LANG=en_US.UTF-8
export VISUAL="${EDITOR}"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/config.vim" | source $MYVIMRC'
export SCREENRC="${HOME}/.config/screen/screenrc"
export PAGER=less
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PATH=$PATH:$HOME/.local/bin
export WORKSPACE_DIR=$HOME/code
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=10000000
export PROMPT_COMMAND="history -a; history -n" # append and reload the history after each command
export HISTIGNORE='ls:ll:cd:pwd:bg:fg:history'

# sets and options bash
set -o noclobber
set -o notify
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s hostcomplete
shopt -s lithist

# alias
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
alias refresh='source ~/.bashrc'
alias screen-killall='screen -ls | grep -ioP "^\t.+?\." | sed -s "s/\t//g;s/\.//g" | xargs kill'
alias venv-py='python3 -m venv "$HOME/.cache/venvs/$(pwd | rev | cut -d / -f-1 | rev)" &&  echo "virtualenv created on ~> $HOME/.cache/venvs/$(pwd | rev | cut -d / -f-1 | rev)"'
alias g='git'
alias json-pretty='python3 -m json.tool | less'

# git completions and prompt {{{
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash
[ -f /usr/share/git/completion/git-prompt.sh ] && source /usr/share/git/completion/git-prompt.sh

# termux settings
[ -f $PREFIX/etc/bash_completion.d/git-completion.bash ] && source $PREFIX/etc/bash_completion.d/git-completion.bash
[ -f $PREFIX/etc/bash_completion.d/git-prompt.sh ] && source $PREFIX/etc/bash_completion.d/git-prompt.sh

# }}}

# bash completions {{{

[ -f /etc/bash_completion ] && source /etc/bash_completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# termux settings
[ -r $PREFIX/share/bash-completion/bash_completion ] && . $PREFIX/share/bash-completion/bash_completion

# }}}

# from https://github.com/rupa/z
[ -f $HOME/.local/share/z/z.sh ] && source $HOME/.local/share/z/z.sh

# from https://github.com/rupa/v
[ -f $HOME/.local/share/v/v ] && export PATH=$PATH:$HOME/.local/share/v

# from https://asdf-vm.com
[ -f $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && . $HOME/.asdf/completions/asdf.bash

# from https://direnv.net/
[ -x "$(command -v direnv)" ] && eval "$(direnv hook bash)"

# from https://github.com/gutierri/screen-workdir.sh
[ -f $HOME/.local/share/screen/screen-workdir.sh/screen-workdir.sh ] && source ~/.local/share/screen/screen-workdir.sh/screen-workdir.sh

# autocomplete for alias {{{

# from https://repo.cykerway.com/complete-alias.html
[ -f $HOME/.local/share/complete-alias/complete_alias ] && source $HOME/.local/share/complete-alias/complete_alias

complete -F _complete_alias g
complete -F _complete_alias e

# }}}

# DIRENV {{{

show_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
        echo "(venv:$(basename $VIRTUAL_ENV)) "
    fi
}
export -f show_virtual_env

# }}}


export PS1='$(show_virtual_env)$([ \j -gt 0 ] && echo "(jobs:\j) ")\W$(__git_ps1 " \[\e[1;91m\]on\[\e[0m\] git:%s")> '
export PS2='... '

# SCREEN {{{

if echo $TERM | grep ^screen -q || [[ -n $STY ]]
then
    # update title on gnu/screen
    SCREEN_PROMPT_COMMAND='echo -ne "\033k\033\0134"'
    PROMPT_COMMAND="$SCREEN_PROMPT_COMMAND;$PROMPT_COMMAND"

    if [[ -n $DIRENV_DIR ]]; then
        direnv reload
    fi
fi

# }}}

stty -ixon # disable flow control (and enable c-s for search bind bash)

if echo $PREFIX | grep -q "com.termux"; then
	if ! pgrep okc-ssh-agent > /dev/null; then
		okc-ssh-agent > "$PREFIX/tmp/okc-ssh-agent.env"
	fi
	source "$PREFIX/tmp/okc-ssh-agent.env"
fi
