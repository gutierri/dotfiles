#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

pkill dzen2
pkill qconsole
pkill stalonetray
pkill redshift
pkill xbanish

sleep 0.5

xsetroot -solid "#EBEBEB" &
redshift &
xrdb -load $HOME/.Xresources &
stalonetray -c $HOME/.config/stalonetray/stalonetrayrc &
qconsole -h 240 &
xbanish &
$BASEDIR/dzen_widgets.sh | dzen2 -ta l -w 1300 &
