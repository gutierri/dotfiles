#!/usr/bin/env bash

function screen_sessions() {
    screen -ls | grep -ioP "^\t.+" | cut -f2
}

if [[ -z $1 ]]; then
    echo "new"
    screen_sessions
else
    if [[ x"new" = x"${1}" ]]; then
        coproc ( rofi-sensible-terminal -e screen -c "$HOME/.config/screen/screenrc" -S "rofi-${RANDOM}" & > /dev/null 2>&1 )
    else
        coproc ( rofi-sensible-terminal -e screen -r "${1}" & > /dev/null 2>&1 )
    fi
    exit 0
fi
