#!/usr/bin/env bash

### Try
# pipx install trash-cli
#  xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
#  git-daemon git-gui gitk git-web python311-mutagen python311-pycryptodomex python311-websockets yad
#  python: plyer: not found, python311-python-for-android??
# wayland-logout: install wf-shell
# wtw: simple text widget
# wayfire
# dunst clipman

### installed for compiling
# SwayOSD: sassc
# sfwbar: gtk3-devel libjson-c-devel gtk-layer-shell-devel wayland-protocols-devel
# ironbar: luajit-devel lua54-lgi

# OpenCL: intel-opencl

### precompiled from github:
# flavours, tinty, matugen, base16-builder-go, rgr, satty, tinted-builder-rust,
# ddh, hck, ianny, ouch, ox, rga, rsftch, rustic, suchit, fselect, app, scout

### different way of installation
# distrobox: curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
#	curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/uninstall | sudo sh
#	then uninstall podman with zypper

sudo zypper in labwc hyprland sway jay weston \
    rofi-wayland libnotify-tools SwayNotificationCenter eww \
	wob wev lswt wtype wlrctl brightnessctl grim slurp wayshot waysip \
	kanshi gammastep gammastep-indicator wlr-randr wf-shell \
	swaybg swayidle swaylock wlopm wl-clipboard \
	hypridle hyprlock waycheck xdg-desktop-portal-wlr \
	swayidle-bash-completion swaylock-bash-completion wl-clipboard-bash-completion \
	starship eza lsd bat fd sd igrep ripgrep zoxide mcfly dust dysk tealdeer \
	procs tokei hyperfine ouch bottom macchina \
	grex pastel git-delta jaq onefetch trippy \
	broot yazi yazi-bash-completion \
	git git-core git-email stow jq aria2 zsync fastfetch fzf fzf-bash-integration \
	libsixel-utils \
	python311-pyxdg python311-pipx python311-yt-dlp python311-Kivy \
	python311-html5lib python311-beautifulsoup4 python311-PyQt6 \
	python311-python-lsp-server \
	pavucontrol playerctl mpv libopenh264-7 \
	flatpak opi poppler-tools xdg-user-dirs \
	clamav java-22-openjdk sl podman meson micro-editor helix lapce \
	gparted featherpad bleachbit sqlitebrowser NetworkManager-applet
 \
	patterns-kde-kde_plasma polkit-kde-agent-6 kde-cli-tools6 diskmonitor \
	systemsettings6 kdialog plasma6-systemmonitor kdeconnect-kde \
	dolphin konsole okular gwenview ark kate partitionmanager filelight spectacle ghostwriter



sudo opi -P sfwbar

pipx install ytcc wpgtk

cargo install trashy mprocs wayout amp xcp rusti-cal rebos

flatpak install -u org.mozilla.firefox \
	org.mozilla.Thunderbird \
	org.videolan.VLC \
	io.github.hakuneko.HakuNeko \
	org.kde.falkon \
	org.kde.kcalc \
	org.kde.ktorrent


# sudo zypper addrepo --refresh   https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed   snappy
# sudo zypper --gpg-auto-import-keys refresh
# sudo zypper dup --from snappy
# sudo zypper install snapd
# sudo systemctl enable --now snapd
# sudo systemctl enable --now snapd.apparmor

sudo snap install bash-language-server --classic
