#!/usr/bin/env bash


if pgrep -f "yad --calendar --title=so-calendaryad*"
then
    pkill -f "yad --calendar --title=so-calendaryad*"
    exit 0
fi


yad --calendar --title="so-calendaryad" --undecorated --no-buttons --mouse --escape-ok --close-on-unfocus --skip-taskbar
