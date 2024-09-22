#!/usr/bin/env bash

# Background / Wallpaper chooser

BG_DIR="$HOME/.config"
BG_FILE="$HOME/.wallpaper"

my_color="#4d4d4d"
so_bg_setter="swaybg "
my_bg=""

set_wallpaper() {
    return_dialog=""

    if ! type kdialog > /dev/null; then
        if ! type yad > /dev/null; then
            echo "This script depends on eather of kdialog or yad\nPlease consider ininstalling one of them to use this script."
        else
            # yad --file --quoted‐output --mime-filter=
            return_dialog=`yad --title "so-wallpaper-dialog" --file --quoted‐output --mime-filter="image/jpeg image/png image/webp"`
        fi
    else
        return_dialog=`kdialog --title "so-wallpaper-dialog" --getopenfilename $HOME 'image/jpeg image/png image/webp'`
    fi


    if [ ! -z "$return_dialog" ]; then
        echo "$return_dialog" > "$BG_FILE"
        so-bg-locker.sh "image" "$return_dialog"
        pkill $so_bg_setter
        `$so_bg_setter -i "$return_dialog"`
    fi
}

get_wallpaper() {
    if [ -f "$BG_FILE" ]; then
        my_bg=`cat "$BG_FILE"`
        if [ -f "$my_bg" ]; then
            echo "-i $my_bg"
        else
            echo "-c $my_bg"
        fi
    else
        echo "-c $my_color"
    fi
}

set_color () {
    return_dialog=""

    if ! type kdialog > /dev/null; then
        if ! type yad > /dev/null; then
            echo "This script depends on eather of kdialog or yad\nPlease consider ininstalling one of them to use this script."
        else
            return_dialog=`yad --title "so-wallpaper-dialog" --color --gtk‐palette`
        fi
    else
        return_dialog=`kdialog --title "so-wallpaper-dialog" --getcolor`
    fi


    if [ ! -z "$return_dialog" ]; then
        echo "$return_dialog" > "$BG_FILE"
        so-bg-locker.sh "color" "$return_dialog"
        pkill $so_bg_setter
        `$so_bg_setter -c "$return_dialog"`
    fi
}

usage() {
    echo "Usage: $0 set|get wallpaper|color"
}

if [ $# -eq 0 ]; then
    return_dialog=""

    if ! type kdialog > /dev/null; then
        if ! type yad > /dev/null; then
            echo "This script depends on eather of kdialog or yad\nPlease consider ininstalling one of them to use this script."
            exit 1
        else
            return_dialog=`yad --center --skipy --title="Choose a Wallpaper" --image="dialog-info" --text="Do you want to set a <b>Color</b> or an <b>Image</b> as your <b>Wallpaper</b>?" --button=yad-no:3 --button="Set Color":1 --button="Set Image":2`
        fi
    else
        return_dialog=`kdialog --title "Choose a Wallpaper" --radiolist "Choose your option" 1 "Image" on 2 "Color" off`
    fi

    if [ $return_dialog -eq 1 ]; then
        set_wallpaper
        exit 0
    elif [ $return_dialog -eq 2 ]; then
        set_color
        exit 0
    else
        exit 1
    fi
else
    case $1 in
        set)
            case $2 in
                wallpaper) set_wallpaper;;
                color) set_color;;
                *) usage
            esac
            ;;
        get) get_wallpaper;;
        *) usage
    esac
fi

