#!/usr/bin/env bash

SODIR=""
if [ -d /media ]; then
  if [ -d /media/$USER ]; then
    SODIR="/media/$USER"
  else
    SODIR="/media"
  fi
else
  SODIR="/run/media/$USER"
fi

if [ ! -f ~/.bashrc ]; then
  mv ~/.bashrc $SODIR/Apps/so-config/config/`date -I`.bashrc
  ln -s $SODIR/Apps/so-config/config/bashrc ~/.bashrc
fi

mkdir -p  ~/.local/bin
mkdir -p ~/.local/share/applications
mkdir ~/.config


ln -s $SODIR/Apps/so-config/icons ~/.icons
ln -s $SODIR/Apps/so-config/themes ~/.themes
ln -s $SODIR/Apps/so-config/fonts ~/.fonts
# ln -s -T $SODIR/Apps/so-config/xdman ~/.xdman
# ln -s $SODIR/Apps/var-flatpaks ~/.var
# ln -s ~/.var/app/org.mozilla.Thunderbird/.thunderbird ~/.thunderbird
# ln -s ~/.var/app/org.mozilla.firefox/.mozilla ~/.mozilla
ln -s $SODIR/SDisque/Disque-S/Documents/xdman ~/Downloads

ln -s $SODIR/Apps/so-config/icons ~/.local/share/icons
ln -s $SODIR/Apps/so-config/local/share/rofi ~/.local/share/rofi
ln -s $SODIR/Apps/so-config/local/share/ytcc ~/.local/share/ytcc
ln -s $SODIR/Apps/flatpaks ~/.local/share/flatpak
ln -s $SODIR/Apps/so-config/local/share/vdhcoapp ~/.local/share


# X.org
ln -s $SODIR/Apps/so-config/config/openbox ~/.config/openbox
ln -s $SODIR/Apps/so-config/config/tint2 ~/.config/tint2
ln -s $SODIR/Apps/so-config/config/jgmenu ~/.config/jgmenu
ln -s $SODIR/Apps/so-config/config/picom ~/.config/picom
ln -s $SODIR/Apps/so-config/config/conky ~/.config/conky
ln -s $SODIR/Apps/so-config/config/redshift.conf ~/.config/redshift.conf

# Wayland
ln -s $SODIR/Apps/so-config/config/hypr ~/.config/hypr
ln -s $SODIR/Apps/so-config/config/sway ~/.config/sway
ln -s $SODIR/Apps/so-config/config/weston ~/.config/weston
ln -s $SODIR/Apps/so-config/config/strata ~/.config/strata
ln -s $SODIR/Apps/so-config/config/wayfire ~/.config/wayfire
ln -s ~/.config/wayfire/wayfire.ini ~/.config/wayfire.ini
ln -s ~/.config/wayfire/wf-shell.ini ~/.config/wf-shell.ini
ln -s $SODIR/Apps/so-config/config/labwc ~/.config/labwc
ln -s $SODIR/Apps/so-config/config/sfwbar ~/.config/sfwbar
ln -s $SODIR/Apps/so-config/config/waybar ~/.config/waybar
ln -s $SODIR/Apps/so-config/config/ironbar ~/.config/ironbar
ln -s $SODIR/Apps/so-config/config/wleave ~/.config/wleave
ln -s $SODIR/Apps/so-config/config/wlogout ~/.config/wlogout
ln -s $SODIR/Apps/so-config/config/swayidle ~/.config/swayidle
ln -s $SODIR/Apps/so-config/config/swaylock ~/.config/swaylock
ln -s $SODIR/Apps/so-config/config/swaync ~/.config/swaync
ln -s $SODIR/Apps/so-config/config/swayosd ~/.config/swayosd
ln -s $SODIR/Apps/so-config/config/gammastep ~/.config/gammastep
ln -s $SODIR/Apps/so-config/config/fuzzel ~/.config/fuzzel
ln -s $SODIR/Apps/so-config/config/wofi ~/.config/wofi
ln -s $SODIR/Apps/so-config/config/wob ~/.config/wob
ln -s $SODIR/Apps/so-config/config/btop ~/.config/btop
ln -s $SODIR/Apps/so-config/config/gBar ~/.config/gBar
ln -s $SODIR/Apps/so-config/config/alacritty ~/.config/alacritty
ln -s $SODIR/Apps/so-config/config/miriway-shell.config ~/.config/miriway-shell.config

# Both
ln -s $SODIR/Apps/so-config/config/starship.toml ~/.config/starship.toml
ln -s $SODIR/Apps/so-config/config/qt6ct ~/.config/qt6ct
ln -s $SODIR/Apps/so-config/config/systemd ~/.config/systemd
ln -s $SODIR/Apps/so-config/config/eww ~/.config/eww
ln -s $SODIR/Apps/so-config/config/dunst ~/.config/dunst
ln -s $SODIR/Apps/so-config/config/rofi ~/.config/rofi
ln -s $SODIR/Apps/so-config/config/coranviewer ~/.config/coranviewer
ln -s $SODIR/Apps/so-config/config/ytcc ~/.config/ytcc
ln -s $SODIR/Apps/so-config/config/mpv ~/.config/mpv
ln -s $SODIR/Apps/so-config/config/aria2 ~/.config/aria2
ln -s $SODIR/Apps/so-config/config/micro ~/.config/micro
ln -s $SODIR/Apps/so-config/config/nano ~/.config/nano

# Rust tools
ln -s $SODIR/Apps/so-config/config/bat ~/.config/bat
ln -s $SODIR/Apps/so-config/config/flavours ~/.config/flavours
ln -s $SODIR/Apps/so-config/config/lsd ~/.config/lsd
ln -s $SODIR/Apps/so-config/config/yazi ~/.config/yazi
ln -s $SODIR/Apps/so-config/config/sk ~/.config/sk
ln -s $SODIR/Apps/so-config/config/dust ~/.config/dust

mkdir -p ~/.config/home-manager
for i in $SODIR/Apps/so-config/home-manager/*; do
  if [ "$i" = "$SODIR/Apps/so-config/home-manager/home.nix" ]; then
    if [ "$USER" = "salw" ]; then
      sed 's/home-x.nix/home-wl.nix/g' "$i" > ~/.config/home-manager/home.nix
    fi
  else
    ln -s "$i" ~/.config/home-manager/
  fi
done

for i in $SODIR/Apps/so-config/local/bin/*; do
  ln -s "$i" ~/.local/bin/
done

for i in $SODIR/Apps/so-config/local/share/applications/*; do
  ln -s "$i" ~/.local/share/applications/
done

mkdir -p $HOME/.config/systemd/user
#cp -v $SODIR/Apps/so-config/config/systemd/user/sobmenu-monitor.service
sobmenu-monitor.py
