#!/usr/bin/env bash

#
#     greetd
#     wev lswt wtype wlrctl
#     kanshi
#     hypridle
#     python311-pyxdg
#     python311-html5lib
#     python311-beautifulsoup4 python311-PyQt6 \
#     python311-python-lsp-server \
#     java-22-openjdk podman  \
#     bleachbit
#     breeze kdeconnect-kde polkit-kde-agent-6  \

# CachyOS:

sudo pacman -Syu brightnessctl gvfs ntfs-3g \
    github-cli meson python-pipx python-pyqt6 rust scdoc stow \
    7zip aria2 clamav flatpak libadwaita libnotify libvips lxqt-policykit xsettingsd \
    labwc \
    gammastep hyprlock hyprpicker swayidle swayimg swaync waycheck wlr-randr \
    pop-launcher \
    nwg-look sqlitebrowser xdg-desktop-portal-gtk zenity \
    imv kitty mpv network-manager-applet qt6ct \
    lxqt-admin lxqt-config lxqt-sudo lxqt-powermanagement lxqt-session lxqt-wayland-session \
    pcmanfm-qt qps xdg-desktop-portal-lxqt \
    breeze breeze-icons kdialog konsole partitionmanager qt6-virtualkeyboard \

paru -S hyprland-qtutils eww

. ./common.sh
