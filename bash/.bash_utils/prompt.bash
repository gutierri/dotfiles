#!/usr/bin/env bash

# Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="branch"

PS1='\u \[\e[1;91m\]at\[\e[0m\] \h \[\e[1;91m\]in\[\e[0m\] \W$(__git_ps1 " \[\e[1;91m\]on\[\e[0m\] git:%s")\n% '
PS2='... '
