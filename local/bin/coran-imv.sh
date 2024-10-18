#!/usr/bin/env bash

last_page=~/.config/coranviewer/last_page_imv.txt
curr_page="$(cat $last_page)"

imv -n "$curr_page" "$(dirname "$curr_page")" &
imv_pid=$!

sleep 1

imv-msg $imv_pid bind q exec 'echo $imv_current_file > ~/.config/coranviewer/last_page_imv.txt'\; quit

