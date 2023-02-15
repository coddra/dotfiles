#!/bin/bash

cd "$(dirname "$0")"

if [[ $# -eq 0 ]]; then
    cat "./mode"
    pidof mode.sh
    sleep 10
    exit
fi



case "$1" in
    "laptop")
        ./group-msg.sh tray quit
        ./group-msg.sh wss-tablet hide
        ./group-msg.sh portrait hide
        ./group-msg.sh landscape hide
        i3-msg gaps top all set 17
        i3-msg gaps bottom all set 0
        ./group-msg.sh wss show
        ./group-msg.sh sysinfo show
        polybar -q tray &
        ./group.sh 1 tray
        feh --bg-fill ~/.config/i3/wallpaper
        echo laptop > ./mode
        ;;
    "tablet")
        ./group-msg.sh wss hide
        ./group-msg.sh sysinfo hide
        i3-msg gaps top all set 49
        ./group-msg.sh wss-tablet show
        echo tablet > ./mode
        ;;
    "portrait")
        ./group-msg.sh tray quit
        ./group-msg.sh landscape hide
        i3-msg gaps bottom all set 49
        ./group-msg.sh portrait show
        polybar -q tray-portrait &
        ./group.sh 1 tray
        feh --bg-fill ~/.config/i3/wallpaper
        echo portrait > ./mode
        ;;
    "landscape")
        ./group-msg.sh tray quit
        ./group-msg.sh portrait hide
        i3-msg gaps bottom all set 0
        ./group-msg.sh landscape show
        polybar -q tray-landscape &
        ./group.sh 1 tray
        feh --bg-fill ~/.config/i3/wallpaper
        echo landscape > ./mode
        ;;
    *)
        echo "Usage: $0 <laptop|tablet|portrait|landscape>"
        ;;
esac
