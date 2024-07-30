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

mkdir -p  ~/.local/bin
mkdir -p ~/.local/share/applications
mkdir ~/.config

stow -d $SODIR/Apps/so-config/stow -t $HOME --dotfiles \
  alacritty aria2 bat broot btop coranviewer dunst dust eww fuzzel \ gammastep hypr i3status-rust ironbar labwc lsd micro mpv nano navi \ qt6ct rofi sfwbar starship.toml sway swayidle swaylock swaync swayosd \ wallust waybar wleave wob yazi ytcc \
  vdhcoapp fonts themes icons


for i in $SODIR/Apps/so-config/divs/local/bin/*; do
  ln -s "$i" ~/.local/bin/
done

for i in $SODIR/Apps/so-config/divs/local/share/applications/*; do
  ln -s "$i" ~/.local/share/applications/
done

fc-cache -f -v

