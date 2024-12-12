#!/usr/bin/env bash

last_page=~/.config/coranviewer/last_page_sway.txt
curr_page="$(cat $last_page)"

swayimg \
    -p 0,0 \
    --config='keys.viewer.q=exec echo "%" > ~/.config/coranviewer/last_page_sway.txt' \
    $curr_page
