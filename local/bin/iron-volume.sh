#!/usr/bin/env bash

if [ "$1" == "sink" -a "$2" == "get" -a "$3" == "volume" ]; then
    pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | awk '{gsub(/%/, "", $5); print $5}'
elif [ "$1" == "sink" -a "$2" == "set" -a "$3" == "volume" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ $4
elif [ "$1" == "sink" -a "$2" == "get" -a "$3" == "mute" ]; then
    LANG=C pactl get-sink-mute @DEFAULT_SINK@ | awk '{ if ($2 == "no") printf "Mute"; else printf "Unmute" }'
elif [ "$1" == "sink" -a "$2" == "set" -a "$3" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ "$1" == "source" -a "$2" == "get" -a "$3" == "volume" ]; then
    LANG=C pactl get-source-volume @DEFAULT_SOURCE@ | awk '/Volume:/ {printf "%s ",$5}' | cut -f1 -d ' ' | cut -f1 -d '%'
elif [ "$1" == "source" -a "$2" == "set" -a "$3" == "volume" ]; then
    pactl set-source-volume @DEFAULT_SOURCE@ $4
elif [ "$1" == "source" -a "$2" == "get" -a "$3" == "mute" ]; then
    LANG=C pactl get-source-mute @DEFAULT_SOURCE@ | awk '{ if ($2 == "no") printf "Mute"; else printf "Unmute" }'
elif [ "$1" == "source" -a "$2" == "set" -a "$3" == "mute" ]; then
    LANG=C pactl set-source-mute @DEFAULT_SOURCE@ toggle
else
    echo "Error"
fi
