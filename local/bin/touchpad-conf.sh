#!/bin/sh

# configure touchpad

TOUCH_ID=$(xinput -list | grep Touchpad | awk '{print $6}' | cut -d '=' -f 2)

enable_touchpad () {
    DEVICE=$(xinput --list-props $TOUCH_ID | grep "Device Enabled")
    DEVICE_ENABLED=$(echo $DEVICE | awk '{print $4}')

    if [ $DEVICE_ENABLED -eq 0 ]; then
        DEVICE_ENABLED_PROP_ID=$(echo $DEVICE | awk '{print $3}' | cut -d '(' -f 2 | cut -d ')' -f 1)

        xinput set-prop $TOUCH_ID $DEVICE_ENABLED_PROP_ID 1
    fi
}

enable_tap () {
    TAPPING=$(xinput --list-props $TOUCH_ID | grep "Tapping Enabled (")
    TAPPING_ENABLED=$(echo $TAPPING | awk '{print $5}')

    if [ $TAPPING_ENABLED -eq 0 ]; then
        TAPPING_PROP_ID=$(echo $TAPPING | awk '{print $4}' | cut -d '(' -f 2 | cut -d ')' -f 1)

        xinput set-prop $TOUCH_ID $TAPPING_PROP_ID 1
    fi
}

enable_touchpad
enable_tap
