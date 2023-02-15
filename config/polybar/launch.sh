#!/bin/bash
cd "$(dirname "$0")"

echo 'Terminating all previous instances'
polybar-msg cmd quit

echo 'Runnig workspace indicators'
for tab in "" "-tablet"
do
	for i in {1..9}
	do
		polybar -q ws-$i$tab &
	done

	./group.sh 9 wss$tab
done

echo 'Running sytem info'
polybar -q date &
polybar -q tempscript &
polybar -q cpu &
polybar -q memory &
polybar -q filesystem &
polybar -q battery &
polybar -q layout &
polybar -q sound &
polybar -q brightness &

./group.sh 9 sysinfo

echo 'Orientation specific bars'
for o in 'landscape' 'portrait'
do
	polybar -q X-$o &
	polybar -q date-$o &
	polybar -q battery-$o &
	polybar -q sound-$o &
	polybar -q brightness-$o &
	./group.sh 5 $o
done

echo 'Background elements'
polybar -q bg-date &
./group.sh 1 bg

sleep 5

echo 'Starting messaging section'
./mode.sh laptop

echo 'Writing workspace information'
~/.config/polybar/wsindicator-update.sh

#These are launched only at the end, this way they end up behind the bg-date bar
polybar -q bg-clock &
./group.sh --add 1 bg

echo 'Done'
