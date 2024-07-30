#

if pgrep -f "yad --scale --title=so-volumeicon*"
then
    pkill -f "yad --scale --title=so-volumeicon*"
    exit 0
fi

width=50
height=220

curr_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep "Volume:" | awk '{gsub(/%/, "", $5); print $5}')

image="volume"

if [ $curr_vol -le 33 ]; then
    image="audio-volume-low-symbolic.symbolic"
elif [ 33 -lt $curr_vol -a $curr_vol -lt 66 ]; then
    image="audio-volume-medium-symbolic.symbolic"
elif [ 66 -lt $curr_vol -a $curr_vol -le 100 ]; then
    image="audio-volume-high-symbolic.symbolic"
fi

volumeicon () {
    yad --scale --title="so-volumeicon" --undecorated --escape-ok --mouse --skip-taskbar --close-on-unfocus --vertical --image=$image --value=$curr_vol --step=3 --page=6 --mark="":"$curr_vol"  --button=yad-ok --width=$width --height=$height
}

vol=$(volumeicon)

if [ $vol -le 80 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ "$vol%"
elif [ $vol -ge 80 -a $vol -le 100 ]; then
    if yad --center --skipy --title="Alert Volume Settings" --window-icon="audio-volume-high-symbolic" --image="dialog-warning" --text="You are about to set the volume to a very high value <b>$vol%</b>.\n<b>Do you want to continue</b>?" --button=yad-no:2 --button=yad-ok:0

    then
        pactl set-sink-volume @DEFAULT_SINK@ "$vol%"
    fi
fi
