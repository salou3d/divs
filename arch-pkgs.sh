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

###
# Deps for:
# Brisk: libkeybinder3 libayatana-appindicator

# CachyOS:

sudo pacman -Syu brightnessctl gvfs ntfs-3g \
    espeak-ng festival libayatana-appindicator libkeybinder3 \
    chafa github-cli meson python-pipx python-pyqt6 rust scdoc stow xmlstarlet \
    7zip aria2 clamav flatpak libadwaita libnotify libvips tmux xsettingsd \
    cosmic-session labwc \
    gammastep hyprlock hyprpicker swayidle swayimg swaync waycheck wlr-randr \
    gimp nwg-look sqlitebrowser xdg-desktop-portal-gtk yad zenity \
    imv kitty mpv network-manager-applet pop-launcher qt6ct \
    lxqt-admin lxqt-config lxqt-policykit lxqt-powermanagement lxqt-session lxqt-sudo lxqt-wayland-session \
    pcmanfm-qt qps xdg-desktop-portal-lxqt \
    breeze breeze-icons kdialog kirigami2 konsole kwalletmanager partitionmanager qt6-virtualkeyboard \
    virt-manager virt-viewer

paru -S wl-screenrec # imaginer

. ./common.sh
