#!/usr/bin/env bash
# noto sans nerd font                           
image=""

curr_state=$(LANG=C pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

curr_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | awk '{gsub(/%/, "", $5); print $5}')

case "$curr_state" in
    no)
        if [ $curr_vol -le 33 ]; then
            #image="$icon_path/audio-volume-low.svg"
            image="󰕿" #""
        elif [ 33 -lt $curr_vol -a $curr_vol -lt 66 ]; then
            #image="$icon_path/audio-volume-medium.svg"
            image="󰖀" #""
        elif [ 66 -lt $curr_vol -a $curr_vol -le 100 ]; then
            #image="$icon_path/audio-volume-high.svg"
            image="󰕾" #""
        fi
#         echo "$image"
#         printf "%b$curr_vol%%"
        echo "$image $curr_vol%"
    ;;
    yes)
    # echo "$icon_path/audio-volume-muted.svg"
    #printf ""
    echo "󰖁" #""
    ;;
esac
