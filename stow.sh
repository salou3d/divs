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

stow -d $HOME/Documents/so-config/stow -t $HOME --dotfiles \
  alacritty amp anyrun app aria2 bat bottom broot btop coranviewer dunst dust \
  eget eww fastfetch felix flavours fselect fuzzel gammastep handlr helix hypr \
  hyprlauncher hyprwall \
  i3status-rust imv ianny ironbar jay kitty labwc lsd macchina matugen micro mpv nano \
  navi nwg-wrapper onagre procs profile qt6ct rebos ripgrep-app rofi rsfetch \
  satty scout sfwbar sk starship sway swayidle swayimg swaylock swaync swayosd \
  tinted-theming walker wallust waybar wayfire waypaper weathercrab wleave \
  wlogout wob wofi wpaperd yazi ytcc \
  vdhcoapp fonts themes icons


for i in $HOME/Documents/so-config/divs/local/bin/*; do
  ln -s "$i" ~/.local/bin/
done

for i in $HOME/Documents/so-config/divs/local/share/applications/*; do
  ln -s "$i" ~/.local/share/applications/
done

fc-cache -f -v

