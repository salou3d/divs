#!/usr/bin/env bash

currwall="$(xdg-user-dir PICTURES)/current-wallpaper"
blurwall="$(xdg-user-dir PICTURES)/blured-wallpaper"
basedir="/media/SDisque/Disque-S/Images/walls"

function set_bg() {
    if [ "$XDG_CURRENT_DESKTOP" == "sway" ]; then
        swaymsg output "*" background "$currwall" fill
    elif ["$XDG_CURRENT_DESKTOP" == "Hyprland" ]; then
        hyprctl hyprpaper preload "$currwall"
    else
        if command -v swaybg; then
            swaybg -i "$1" &
        elif command -v hyprpaper; then
            hyperpaper "$1"
        else
            exit 2
        fi
    fi

}

if [ $# -eq 0 ]; then
    echo "This script is designed to run with WAYPAPER GUI, to apply tinted-theming from the selected wallpaper."
    echo "You can still use it the following way:"
    echo "USAGE: $0 /path/to/image"

    exit 1
fi

image="$1"

if [ -f "$image" ]; then
    tintyname=$(echo $image | awk '{l=split($0, A, /\//); gsub(/[\. ]/, "-", A[l]); print A[l] }')

    #image="$basedir/$image"

#     echo "image: $image"
#     echo "tintyname: $tintyname"

    #echo "$image" > .wallpaper
    rm "$currwall"
    cp "$image" "$currwall"

    set_bg "$image"

    tinty generate-scheme --name $tintyname --slug $tintyname --system base16 --variant dark --save  $image

    tinty apply base16-$tintyname

    # for apps that I couldn't theme with tinty
    flavours apply base16-flavours-colors-file

    accentcolor=$(grep base0E ~/.local/share/tinted-theming/tinty/custom-schemes/base16/$tintyname.yaml | awk '{print $2}' | sd "'" "")

    plasma-apply-colorscheme -a "#$accentcolor" BreezeDark
    plasma-apply-lookandfeel -a org.kde.breezedark.desktop

#     gsettings set org.gnome.desktop.interface accent-color "#$accentcolor"

    magick "$image" -blur "50x30" "$blurwall"

    so-bg-locker.sh "image" "$currwall"

#     echo "window { background: url('$blurwall'); background-size: cover;}" > ~/.config/wleave/background.css

else
    exit 1
fi
