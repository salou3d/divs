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

image=$(fd -tf --absolute-path --base-directory "$basedir" | fzf --preview 'fzf-preview.sh {}')

if [ -f "$image" ]; then
#     tintyname=$(echo $image | awk '{l=split($0, A, /\//); gsub(/[\. ]/, "-", A[l]); print A[l] }')

    tintyname=$(basename $image | awk '{ gsub(/[\. ]/, "-"); print }')

    rm "$currwall"
    cp "$image" "$currwall"

    set_bg "$image"

    base_sys="base16"
    if [ ! -z "$1" -a "$1" == "base24" ]; then
        base_sys="$1"
    fi

    tinty generate-scheme --name $tintyname --slug $tintyname --system $base_sys --variant dark --save  $image

    tinty apply "$base_sys-$tintyname"

    # for apps that I couldn't theme with tinty
    flavours apply base16-flavours-colors-file

    accentcolor=$(grep base0E ~/.local/share/tinted-theming/tinty/custom-schemes/base16/$tintyname.yaml | awk '{print $2}' | sd "'" "")

#     plasma-apply-colorscheme -a "#$accentcolor" BreezeDark
#     plasma-apply-lookandfeel -a org.kde.breezedark.desktop

#     gsettings set org.gnome.desktop.interface accent-color "#$accentcolor"

    magick "$image" -blur "50x30" "$blurwall"

    so-bg-locker.sh "image" "$currwall"

#     echo "window { background: url('$blurwall'); background-size: cover;}" > ~/.config/wleave/background.css

    exit 0

else
    exit 1
fi
