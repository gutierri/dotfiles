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
	local n_works=$(ratpoison -c groups | grep -oP "^[0-9].")
	local p_works=""

	for w in $n_works
	do
		if [ -z $(grep "*" <<< $w) ]
		then
			p_works+=" $(sed 's/[^0-9]//g' <<< $w) "
		else
			p_works+=" [$(sed 's/[^0-9]//g' <<< $w)] "
		fi
	done

	echo -n "$p_works"
}

while true
do
	echo -n "^p(_LEFT)$(workspace)^p(_RIGHT)^p(-482)$(mem)    $(vol)    $(bat)    $(clock_date)"
	echo
	sleep 1
done
