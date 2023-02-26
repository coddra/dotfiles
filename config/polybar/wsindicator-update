#!/bin/bash

term_handler() {
	if test -n "$WSS"; then
		exit
	fi
}
trap term_handler TERM
cd "$(dirname "$0")"

echo 'Killing conflicting updaters'
WSS=""
killall -s SIGTERM -e wsindicator-update.sh

echo 'Getting workspace information'
WSS=$(i3-msg -t get_workspaces) 
PIDS=$(cat ./pids/wss)
TABPIDS=$(cat ./pids/wss-tablet)

for i in {1..9} 
do
	WS="${WSS#*"num\":$i"}"

	if [[ $WS == [* ]]; then
		HOOK=0
	elif [[ ${WS#*"focused\":"} == true* ]]; then 
		HOOK=1 
	elif [[ ${WS#*"urgent\":"} = true* ]]; then
		HOOK=2 
	else
		HOOK=3
	fi

	polybar-msg -p $(echo $PIDS | awk "{ print \$$i }") action "#wsindicator-$i.hook.$HOOK"
	polybar-msg -p $(echo $TABPIDS | awk "{ print \$$i }") action "#wsindicator-$i.hook.$HOOK"
done
