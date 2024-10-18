#!/usr/bin/env bash

### Try
# pipx install trash-cli
#  xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr
#  git-daemon git-gui gitk git-web python311-mutagen python311-pycryptodomex python311-websockets yad
#  python: plyer: not found, python311-python-for-android??
# wtw: simple text widget
# wayfire
# dunst clipman

### installed for compiling
# wayland-logout:
# SwayOSD: sassc
# sfwbar: gtk3-devel libjson-c-devel gtk-layer-shell-devel wayland-protocols-devel
# walker: gtk4-layer-shell: vala gtk-doc
# fabric widgets: gobject-introspection gobject-introspection-devel python311-loguru python311-devel librsvg-devel webkit2gtk3-devel typelib-1_0-DbusmenuGtk3-0_4 typelib-1_0-Dbusmenu-0_4
# anyrun:
# onagre:
# sweep-rs/chronicler:
# cthulock llvm18-devel clang18-devel pam-devel
# wf-recorder/wl-screenrec: ffmpeg-7-libavformat-devel ffmpeg-7-libavutil-devel ffmpeg-7-libavcodec-devel ffmpeg-7-libavfilter-devel ffmpeg-7-libavdevice-devel libpulse-devel pipewire-devel

# OpenCL: intel-opencl
# Aswaita for python: typelib-1_0-Graphene-1_0 typelib-1_0-Gtk-4_0 libadwaita-1-0 libadwaita-lang libadwaita-devel
# ironbar: libluajit-5_1-2

### precompiled from github:
# flavours, tinty, matugen, base16-builder-go, rgr, satty, tinted-builder-rust, ddh, hck, ianny, ouch, ox, rga, rsftch, rustic, suchit, fselect, app, scout, htmlq, xh, walker, rust-analyzer, lemminx-linux, vivid, nomino

### different way of installation
# nwg-wrapper: git clone

# distrobox: curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
#	curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/uninstall | sudo sh
#	then uninstall podman with zypper

sudo zypper in zp labwc hyprland patterns-sway-sway weston \
    pop-launcher rofi-wayland wob \
    libnotify-tools SwayNotificationCenter waycheck \
	wev lswt wtype wlrctl wl-clipboard \
	grim slurp wayshot waysip \
	kanshi wlr-randr wlopm brightnessctl gammastep gammastep-indicator \
	swaybg swayidle swaylock swayimg imv libfreeimage3 xdg-desktop-portal-wlr \
	hypridle hyprlock hyprpicker hyprshot hyprland-bash-completion xdg-desktop-portal-hyprland \
	swayidle-bash-completion swaylock-bash-completion wl-clipboard-bash-completion \
	starship lsd bat bat-extras fd sd igrep ripgrep zoxide mcfly dust dysk tealdeer jless entr \
	procs tokei hyperfine ouch bottom macchina \
	grex pastel git-delta jaq onefetch trippy \
	broot yazi yazi-bash-completion swww swww-bash-completion \
	git git-core git-email stow jq aria2 zsync fastfetch fzf fzf-bash-integration \
	libsixel-utils \
	python311-pyxdg python311-pipx python311-yt-dlp python311-Kivy \
	python311-html5lib python311-beautifulsoup4 python311-PyQt6 \
	python311-python-lsp-server \
	pavucontrol playerctl mpv libopenh264-7 \
	flatpak opi poppler-tools xdg-user-dirs qalculate \
	clamav java-22-openjdk sl podman meson micro-editor helix lapce \
	gparted bleachbit sqlitebrowser NetworkManager-applet
 \
	patterns-kde-kde_plasma polkit-kde-agent-6 kde-cli-tools6 diskmonitor partitionmanager \
	systemsettings6 kdialog plasma6-systemmonitor kdeconnect-kde filelight \
	dolphin konsole okular gwenview ark kate spectacle ghostwriter elisa



# sudo opi -P sfwbar

pipx install cute-sway-recorder fabric gallery-dl waypaper wpgtk ytcc

cargo install amp mprocs navi rebos runiq rustlings rusti-cal toipe trashy wayout wl-screenrec xcp

flatpak install -u org.mozilla.firefox \
	org.mozilla.Thunderbird \
	org.videolan.VLC \
	io.github.hakuneko.HakuNeko \
	org.kde.falkon \
	org.kde.ktorrent \
	org.kde.vvave
# 	org.kde.kcalc


# sudo zypper addrepo --refresh   https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed   snappy
# sudo zypper --gpg-auto-import-keys refresh
# sudo zypper dup --from snappy
# sudo zypper install snapd
# sudo systemctl enable --now snapd
# sudo systemctl enable --now snapd.apparmor

sudo snap install bash-language-server --classic
