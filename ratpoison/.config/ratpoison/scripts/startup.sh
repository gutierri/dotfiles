#!/usr/bin/env bash

pkill qconsole
pkill stalonetray
pkill redshift
pkill xbanish

sleep 0.5

redshift &
stalonetray -c $HOME/.config/stalonetray/stalonetrayrc &
qconsole -h 240 &
xbanish &
