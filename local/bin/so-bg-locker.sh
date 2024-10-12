#!/usr/bin/env bash

# usage: so-bg-locker.sh "image" "/path/to/the/image"

if type swaylock > /dev/null; then
    locker_dir="$HOME/.config/swaylock"
    locker_conf="$locker_dir/config"
    if [ ! -d "$locker_dir" ]; then
        mkdir -p "$locker_dir"
        touch "$locker_conf"
    elif [ -d "$locker_dir" -a ! -f "$locker_conf" ]; then
        touch "$locker_conf"
    fi

    blurwall="$(xdg-user-dir PICTURES)/blured-wallpaper"

    if [ ! -f "$blurwall" ]; then
        magick "$2" -blur "50x30" "$blurwall"
    fi

    awk -i inplace -F'=' -v wallp="$1" -v val="$blurwall" '{ if ($1 == wallp) print $1 "=\"" val "\""; else print $0; }' "$locker_conf"
fi

if  type hyprlock > /dev/null; then
    locker_dir="$HOME/.config/hypr"
    locker_conf="$locker_dir/hyprlock.conf"

    if [ ! -d "$locker_dir" ]; then
        mkdir -p "$locker_dir"
        touch "$locker_conf"
        exit 1
    elif [ -d "$locker_dir" -a ! -f "$locker_conf" ]; then
        touch "$locker_conf"
        exit 2
    fi

    mfield="path"

    if [ "$1" == "color" ]; then
        mfield="color"
        mvalue=$(echo "$2" | awk '{gsub(/#/, ""); print}')
    else
        mvalue="$2"
    fi

    awk -i inplace -v val="$mvalue" -v var="$mfield" \
'BEGIN {
tmp = 0;
bg_start = 0;
}
{
if ( $1 == "background" ) {
    tmp = 1;
    if ( $2 == "{" ) {
        bg_start = 1;
    }
    print $0;
}
else if ( tmp == 1 && bg_start == 0 && $1 == "{" ) {
    bg_start = 1;
    print $0;
}
else if ( tmp == 1 && bg_start == 1 && $1 == var ) {
    split($0, A, /=/);
    tmp = 0;
    bg_start = 0;
    if ( var == "color" ) print A[1] "= rgb(" val ")";
    else print A[1] "= " val;
}
else print $0;
}' "$locker_conf"

fi
