#!/usr/bin/env bash

# check if yad/zenity/kdialog is installed with type or command -v

run_gui() {
	
	if ! type kdialog > /dev/null; then
        if ! type yad > /dev/null; then
            echo "This script depends on eather of kdialog or yad\nPlease consider ininstalling one of them to use this script."
        else
            yad --title="so-confirm-logout-dialog" --window-icon="system-shutdown"\
    			--on-top --center --height=100 \
    			--image="$1" --text="Do you want to <b>$2</b>? " \
    			--buttons-layout=center --button=yad-no:2 --button=yad-yes:0
        fi
    else
        kdialog --title "so-confirm-logout-dialog" --icon "$i" --yesno "Do you want to <b>$2</b>? "
    fi
}

image=""
msg=""
session_cmd=""

case $1 in
    lock)
        image="system-lock-screen"
        msg="Lock the screen"
        case $XDG_SESSION_DESKTOP in
            *[wW]ayfire) session_cmd="swaylock -f";;
            *openbox) session_cmd="light-locker-command -l";;
            *) session_cmd="hyprlock";;
       esac
    ;;
    logout)
        image="system-log-out"
        msg="Log out"
#        session_cmd="loginctl terminate-user $USER"
        case $XDG_CURRENT_DESKTOP in
             #*labwc*) session_cmd="labwc -e";;
             *openbox) session_cmd="openbox --exit";;
             *) session_cmd="wayland-logout";;
        esac
    ;;
    hibernate)
        image="system-hibernate"
        msg="Hibernate the computer"
        session_cmd="systemctl -i hibernate"
    ;;
    reboot)
        image="system-reboot"
        msg="Reboot the computer"
        session_cmd="systemctl -i reboot"
    ;;
    suspend)
        image="system-suspend"
        msg="Suspend the computer"
        session_cmd="systemctl -i suspend"
    ;;
    shutdown)
        image="system-shutdown"
        msg="Shutdown the computer"
        session_cmd="systemctl -i poweroff"
    ;;
    *)
    exit 0
    ;;
esac

if run_gui "$image" "$msg" ; then
    `$session_cmd`
fi
