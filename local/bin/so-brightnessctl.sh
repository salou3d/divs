#!/usr/bin/env bash

bright_progress () {

    notify-send -a "so-brightnessctl.sh" -u low -r 6969 -h int:value:"$2" -i "$1" "Brightness: $2%" -t 3000

}

set_brightness () {

    curr_bright=$(brightnessctl get)
    max_bright=$(brightnessctl m)
    half_bright=$(($max_bright / 2))
    five_perc=$(($max_bright * 5 / 100))

    new_bright=$curr_bright

    if [ $1 == "up" ]; then
        new_bright=$(($curr_bright + $five_perc))
    elif [ $1 == "down" ]; then
        new_bright=$(($curr_bright - $five_perc))
    fi

    if [ $new_bright -lt 0 ]; then
        new_bright=0
    elif [ 0 -lt $new_bright -a $new_bright -le $half_bright ]; then
        image="brightness-low"
    elif [ $new_bright -ge $half_bright -a $new_bright -lt $max_bright ]; then
        image="brightness-high"
    elif [ $new_bright -ge $max_bright ]; then
        image="brightness-high"
        new_bright=$max_bright
    fi

    brightnessctl set $new_bright

    #bright_progress "$image" "$new_bright"
    bright_progress "$image" "$(((100 * $new_bright) / $max_bright))"


}

if [ "$1" == "up" -o "$1" == "down" ]; then
    set_brightness "$1"
else
    echo "Usage: $0 up | down"
fi
