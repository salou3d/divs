#!/usr/bin/env bash

# Background / Wallpaper chooser

BG_DIR="$HOME/.config"
BG_FILE="$HOME/.cache/wallpaper"

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
        set_for_locker "image" "$return_dialog"
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
        set_for_locker "color" "$return_dialog"
        pkill $so_bg_setter
        `$so_bg_setter -c "$return_dialog"`
    fi
}

# TODO: when setting a color maybe image should be removed?
set_for_locker() {
    if type swaylock > /dev/null; then
        locker_dir="$HOME/.config/swaylock"
        locker_conf="$locker_dir/config"
        if [ ! -d "$locker_dir" ]; then
            mkdir -p "$locker_dir"
            touch "$locker_conf"
        elif [ -d "$locker_dir" -a ! -f "$locker_conf" ]; then
            touch "$locker_conf"
        fi

        awk -i inplace -F'=' -v wallp="$1" -v val="$2" '{ if ($1 == wallp) print $1 "=\"" val "\""; else print $0; }' "$locker_conf"
    fi

    if  type hyprlock > /dev/null; then
        locker_dir="$HOME/.config/hypr"
        locker_conf="$locker_dir/hyprlock.conf"

        if [ ! -d "$locker_dir" ]; then
            mkdir -p "$locker_dir"
            touch "$locker_conf"
        elif [ -d "$locker_dir" -a ! -f "$locker_conf" ]; then
            touch "$locker_conf"
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

