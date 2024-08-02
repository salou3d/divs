#!/usr/bin/env bash

function set_bg() {
    if [ "$XDG_CURRENT_DESKTOP" == "sway" ]; then
        swaymsg output "*" background $(cat ~/.wallpaper) fill
    elif ["$XDG_CURRENT_DESKTOP" == "Hyprland" ]; then
        echo "Hyprland"
    else
        if command -v swaybg; then
            swaybg -i "$1" &
        elif command -v hyprpaper; then
            hyperpaper "$i"
        else
            exit 2
        fi
    fi

}

basedir="/media/SDisque/Disque-S/Images/JPEG/walls"

image=$(fd -tf --base-directory "$basedir" | fzf)

if [ -f "$basedir/$image" ]; then
    tintyname=$(echo $image | awk '{l=split($0, A, /\//); gsub(/[\. ]/, "-", A[l]); print A[l] }')

    image="$basedir/$image"

    echo "image: $image"
    echo "tintyname: $tintyname"

    tinty generate-scheme --name $tintyname --slug $tintyname --system base16 --variant dark --save  $image

    tinty apply base16-$tintyname

    echo "$image" > .wallpaper

    so-bg-locker.sh "image" "$image"

    set_bg "$image"

    #source ~/.bashrc

else
    exit 1
fi
