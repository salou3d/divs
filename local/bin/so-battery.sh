#!/usr/bin/env bash

bstate=""; bicon=""; bpercent=""
acstate=""; acicon=""

icon_path="$HOME/.icons/breeze-dark/status/symbolic/"
image="battery.svg"
notif_text="placeholder"

get_bat_device_info () {
	BAT_DEV=$(upower -i `upower -e | grep BAT` | awk '{gsub(/ /, ""); print}')
	for info in $BAT_DEV; do
        case $info in
            state:*)
                bstate=$(echo $info | awk '{split($0, A, /:/); print A[2]}')
                ;;
            percentage:*)
                bpercent=$(echo $info | awk '{split($0, A, /:/); print A[2]}')
                ;;
            icon-name:*)
                bicon=$(echo $info | awk '{split($0, A, /:/); print A[2] }')
                ;;
        esac
	done
}

get_ac_device_info () {
	AC_DEV=$(upower -e | grep AC | awk '{gsub(/ /, ""); print}')
	for info in $AC_DEV; do
        case $info in
            online:*)
                acstate=$(echo $info | awk '{split($0, A, /:/); print A[2]}')
                ;;
            icon-name:*)
                acicon=$(echo $info | awk '{split($0, A, /:/); print A[2]}')
                ;;
        esac
	done

}

notify() {

    i=$(echo "$2" | cut -d "'" -f 2)

    notify-send -a "so-battery-yad.sh" -u "$1" -r 6969 -i "$icon_path/$i.svg" -t 3000 "$3" "$4"

}

case $1 in
    low)
        get_bat_device_info

        notify "critical" $bicon "Battery low: $bpercent" "please plug to AC"
        ;;
    full)
        get_bat_device_info

        notify "normal" $bicon "Battery full: $bpercent" "Battery fully charged."
        ;;
    disconnected)
        get_ac_device_info
        get_bat_device_info

        notify "normal" $bicon "AC disconnected!" "Battery: $bpercent"
        ;;
    connected)
        get_ac_device_info
        get_bat_device_info

        notify "normal" $bicon "AC connected!" "Battery: $bpercent"
        ;;
    *)
        echo "Wrong Input"
        ;;
esac





















