#!/bin/sh

## LXQt common settings
contains()
{
    local str="$1" substr="$2"
    [ "$str" = "$substr" -o -z "${str##$substr:*}" -o -z "${str##*:$substr:*}" -o -z "${str%%*:$substr}" ]
}

if [ -z "$XDG_DATA_HOME" ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi

if [ -z "$XDG_CONFIG_HOME" ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -z "$XDG_DATA_DIRS" ]; then
    XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
else
    if ! contains "$XDG_DATA_DIRS" "/usr/share"; then
        XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share"
    fi
fi
export XDG_DATA_DIRS

if [ -z "$XDG_CONFIG_DIRS" ]; then
    export XDG_CONFIG_DIRS="/etc:/etc/xdg:/usr/share"
else
    if ! contains "$XDG_CONFIG_DIRS" '/etc/xdg'; then
        XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:/etc/xdg"
    fi
fi

if [ -z "$XDG_CACHE_HOME" ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi

# Ensure the existence of the 'Desktop' folder
if [ -e "$XDG_CONFIG_HOME/user-dirs.dirs" ]; then
    . "$XDG_CONFIG_HOME/user-dirs.dirs"
else
    XDG_DESKTOP_DIR="$HOME/Desktop"
fi
mkdir -p "$XDG_DESKTOP_DIR"

# Launch DBus if needed
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    if [ -z "$XDG_RUNTIME_DIR" ] || ! [ -S "$XDG_RUNTIME_DIR/bus" ] || ! [ -O "$XDG_RUNTIME_DIR/bus" ]; then
        eval "$(dbus-launch --sh-syntax --exit-with-session)" || echo "startlxqt: error executing dbus-launch" >&2
    fi
fi

# Qt4 platform plugin
export QT_PLATFORM_PLUGIN="kde"

# Qt5 platform plugin
export QT_QPA_PLATFORMTHEME="kde"

# Qt5
export QT_QPA_PLATFORMTHEME="kde"
export QT_EXCLUDE_GENERIC_BEARER=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Qt6
export QT_ACCESSIBILITY=1

# Prevent illegibile text in some KDE apps

export QT_QUICK_CONTROLS_STYLE=org.kde.desktop

# use lxqt-applications.menu for main app menu
#export XDG_MENU_PREFIX="lxqt-"

export XDG_CURRENT_DESKTOP="labwc:wlroots"

# Copy default labwc configuration if not existing
# if [[ ! -d "$XDG_CONFIG_HOME/labwc" ]]
#    then
#    cp -av @CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_DATADIR@/lxqt/wayland/labwc "$XDG_CONFIG_HOME"/
# fi

# Import keyboard layout
#lxqt2labwcexporter
## End LXQt common settings

# enable cursor on VM
VIRT=$(systemd-detect-virt)
if [ ! "$VIRT" = none ]; then
export WLR_NO_HARDWARE_CURSORS=1
echo "Running on virtualized hardware"
fi

# # Find labwc executable
# LABWC_EXECUTABLE=$(which labwc)
# if [ -x "$LABWC_EXECUTABLE" ]; then
# LABWC_VERSION=$("$LABWC_EXECUTABLE" --version | cut -c 7-11 | tr -d '.')
#     echo "$LABWC_VERSION"
#     if [ "$LABWC_VERSION" -lt "072" ]; then
#         echo "Labwc version is minor than 0.7.2."
#         exec labwc -C $XDG_CONFIG_HOME/labwc -s lxqt-session
#     else
#         echo "Labwc version is  0.7.2 or higher, using -S option for exit together with lxqt-session"
#         exec labwc -C $XDG_CONFIG_HOME/labwc -S lxqt-session
#         # with debug:
#         #exec systemd-cat --identifier=labwc labwc -d -C $XDG_CONFIG_HOME/lxqt-wayland/labwc  -S lxqt-session
#    fi
# else
#     echo "labwc not found. Please install labwc. Exiting."
# fi
