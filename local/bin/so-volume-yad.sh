#!/usr/bin/env bash

theme="breeze-dark"
icon_path="$HOME/.icons/$theme"
image="audio-volume"
urgency="low"
if [ ! -d "$icon_path" ]; then
    icon_path="/usr/share/icons/$theme"
fi

volume_progress () {

    notify-send -a "so-volume-yad.sh" -u "$1" -r 6969 -h int:value:"$3" -i "$2" "Volume: $3%" -t 3000

}

volume_mute () {

    notify-send -a "so-volume-yad.sh" -u low -r 6969 -i "$1" "$2" -t 3000
}

set_volume () {

    curr_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | awk '{gsub(/%/, "", $5); print $5}')

    new_vol=$curr_vol

    if [ $1 == "up" ]; then
        new_vol=$(($curr_vol + 5))
    elif [ $1 == "down" ]; then
        new_vol=$(($curr_vol - 5))
    fi

    if [ $new_vol -le 33 ]; then
        image="audio-volume-low"
    elif [ 33 -lt $new_vol -a $new_vol -lt 66 ]; then
        image="audio-volume-medium"
        urgency="normal"
    elif [ 66 -lt $new_vol -a $new_vol -le 100 ]; then
        image="audio-volume-high"
        urgency="critical"
    elif [ $new_vol -ge 104 ]; then
        image="audio-volume-high"
        urgency="critical"
        new_vol=100
    fi

    pactl set-sink-volume @DEFAULT_SINK@ "$new_vol%"

    #i=1
    #while [ $i -le $new_vol ]; do echo $i; i=$(($i + 1)); done |
    volume_progress "$urgency" "$image" "$new_vol"
    #volume_progress "$icon_path/status/22/$image" "$new_vol"

}

toggle_mute () {

    curr_state=$(LANG=C pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    pactl set-sink-mute @DEFAULT_SINK@ toggle
    case $curr_state in
        no)
        image="audio-volume-muted"
        #volume_mute "$icon_path/status/22/$image" "Volume OFF"
        volume_mute "$image" "Volume OFF"
        ;;
        yes)
        set_volume 0 "Volume ON"
        ;;
    esac

}

next_piece () {
    playerctl next

}

previous_piece () {
    playerctl previous
}

play_pause () {
    playerctl play-pause

    status=$(playerctl status)
    pname=$(playerctl metadata -f {{playerName}})
    curr_title=$(playerctl metadata -f '{{artist}}: {{title}}')
    if [ "$status" == "Playing" ]; then
        image="media-playback-playing"
    elif [ "$status" == "Paused" ]; then
        image="media-playback-paused"
    fi

    notify-send -a "so-volume-yad.sh" -u normal -r 6969 -i "$image" -t 3000 "${pname^}: $status" "$curr_title"

}

case $1 in
    up)
    set_volume up "Volume"
    ;;
    down)
    set_volume down "Volume"
    ;;
    mute)
    toggle_mute
    ;;
    next)
    next_piece
    ;;
    prev)
    previous_piece
    ;;
    play-pause)
    play_pause
    ;;
    *)
    printf "Usage: $0 up | down | mute | prev | play-pause | next"
    ;;
esac
