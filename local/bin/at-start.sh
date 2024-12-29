#!/usr/bin/env bash

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    if [ -z "$XDG_RUNTIME_DIR" ] || ! [ -S "$XDG_RUNTIME_DIR/bus" ] || ! [ -O "$XDG_RUNTIME_DIR/bus" ]; then
        eval "$(dbus-launch --sh-syntax --exit-with-session)" || echo "start session: error executing dbus-launch" >&2
    fi
fi

dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY > /dev/null 2>&1 &

# if systemctl --user is-active dunst.service; then
#     systemctl --user stop dunst.service

if ! systemctl --user is-active swaync.service; then
    systemctl --user restart swaync.service
fi

if ! systemctl --user is-active flatpak-session-helper.service; then
    systemctl --user restart flatpak-session-helper.service
fi

if ! systemctl --user is-active dconf.service; then
    systemctl --user restart dconf.service
fi

if ! systemctl --user is-active flatpak-portal.service; then
    systemctl --user restart flatpak-portal.service
fi

if ! pgrep -f polkit-kde-authentication-agent-1; then
    if [ -f /usr/libexec/polkit-kde-authentication-agent-1 ]; then
        /usr/libexec/polkit-kde-authentication-agent-1 &
    elif [ -f /usr/lib/polkit-kde-authentication-agent-1 ]; then
        /usr/lib/polkit-kde-authentication-agent-1 &
    else
        lxqt-policykit-agent &
    fi
fi

# /usr/libexec/geoclue-2.0/demos/agent &
# /usr/libexec/geoclue-2.0/demos/where-am-i -a 4

if ! pgrep xsettingsd; then
    xsettingsd &
fi

if ! pgrep swayosd-server; then
    swayosd-server -s ~/.config/swayosd/style.css &
fi

if ! pgrep playerctld; then
    playerctld daemon
fi

if ! pgrep wl-paste; then
    wl-clipboard-history -t &
fi

if ! pgrep swayidle && ! pgrep hypridle; then
    if command -v hyprlock >/dev/null 2>&1; then
        swayidle &
    elif command -v swaylock >/dev/null 2>&1; then
        swayidle -w -c ~/.config/swayidle/swaylock.conf &
    fi
fi

if ! pgrep nm-applet && command -v nm-applet >/dev/null 2>&1; then
    nm-applet &
fi

if ! pgrep -f gammastep-indicator && command -v gammastep-indicator >/dev/null 2>&1; then
    gammastep-indicator &
    sleep 1
    if ! pgrep -f gammastep-indicator; then
        gammastep &
    fi
fi
