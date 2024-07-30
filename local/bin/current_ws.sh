#!/usr/bin/env bash

CURRENT_WS_FILE="/tmp/current_ws.txt"
NUMBER_WS_FILE="/tmp/number_ws.txt"

num_ws=1
curr_ws=1
new_ws=1

if [ ! -f "$NUMBER_WS_FILE" ]; then
    labwc-workspaces.py --ws-num > $NUMBER_WS_FILE
else
    num_ws=$(cat $NUMBER_WS_FILE)
fi

if [ ! -f "$CURRENT_WS_FILE" ]; then
    echo "$curr_ws" > "$CURRENT_WS_FILE"
else
    curr_ws=$(cat $CURRENT_WS_FILE)
fi

case $1 in
    left)
        if [ $curr_ws -gt 1 ]; then
            new_ws=$(($curr_ws - 1))
            echo "$new_ws" > $CURRENT_WS_FILE
        fi
    ;;
    right)
        if [ $curr_ws -lt $num_ws ]; then
            new_ws=$(($curr_ws + 1))
            echo "$new_ws" > "$CURRENT_WS_FILE"
        fi
    ;;
    current)
        echo "current"
    ;;
    *)
        echo "$1" > $CURRENT_WS_FILE
    ;;
esac
