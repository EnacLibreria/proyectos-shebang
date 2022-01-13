#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin


export $(dbus-launch)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
hora=`date +%H`
dia=`date +%u`

if [ "$dia" -gt 0 ] && [ "$dia" -lt 8 ]
then
	if [ "$hora" -gt 17  ] && [ "$hora" -lt 21 ]
	then
		/home/cesar/bin/hosts.sh 'sitios_desbloqueados.txt'
		/usr/bin/paplay /usr/share/sounds/freedesktop/stereo/network-connectivity-established.oga
		exit 0
	else
		/home/cesar/bin/hosts.sh 'sitios_bloqueados.txt'
		/usr/bin/notify-send -u low "Los sitios fueron bloqueados" --icon=appointment-soon -t 15000
		/usr/bin/paplay /usr/share/sounds/freedesktop/stereo/warning.wav
		exit 0
	fi	
fi
