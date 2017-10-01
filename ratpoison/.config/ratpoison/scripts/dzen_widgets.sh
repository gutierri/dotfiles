#!/usr/bin/env bash

mem(){
	local m=$(free -m | grep -i mem | grep -oP "\d+" | head -n2)
	local f=$(tr '\n' ' ' <<< $m)
	echo -n "MEM :: $(cut -d' ' -f2 <<< $f)/$(cut -d' ' -f1 <<< $f)"
}

clock_date(){
	local time=$(date +"%H:%M %F")
	echo -n "DATE :: $time"
}

vol(){
	local alsa_status=$(amixer get Master | grep -io off | head -n1)
	local alsa_vol=$( amixer get Master | grep -oP "\[\d+" | head -n1 | tr -d '[')
	local alsa_mute_icon="(x)"
	if [ -z $alsa_status ]
	then
		alsa_mute_icon=""
	fi
	echo -n "VOL :: $alsa_vol% $alsa_mute_icon"
}

bat(){
	local perc_bat=$(cat<<< "scale=2; ( $(cat /sys/class/power_supply/BAT0/energy_now) / $(cat /sys/class/power_supply/BAT0/energy_full) ) * 101" | bc -l)
	echo -n "BAT :: $(cut -d '.' -f1 <<< $perc_bat)%"
}

workspace(){
	local groups=$(ratpoison -c groups | grep -oP "^[0-9].")
	local works=""

	for workspace in $groups
	do
		local workspace_n=$(sed 's/[^0-9]//g' <<< $workspace)
		if [ -z $(grep "*" <<< $workspace) ]
		then
			works+=" $(echo $workspace_n + 1 | bc) "
		else
			works+=" [$(echo $workspace_n + 1 | bc)] "
		fi
	done

	echo -n "$works <$(ratpoison -c windows | wc -l)>"
}

disk(){
	echo -n "DISK :: / $(df -h | grep /$ | rev | cut -d ' ' -f2 | rev) /home $(df -h | grep home/ | rev | cut -d ' ' -f2 | rev)"
}

while true
do
	echo -n "^p(_LEFT)$(workspace)^p(_RIGHT)^p(-634)$(disk)    $(mem)    $(vol)    $(bat)    $(clock_date)"
	echo
	sleep 1
done
