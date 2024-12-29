#!/usr/bin/env bash

sudo zypper in labwc hyprland patterns-base-base \
    pop-launcher rofi-wayland wob \
    greetd \
    libnotify-tools SwayNotificationCenter waycheck \
	wev lswt wtype wlrctl wl-clipboard \
	grim slurp \
	kanshi wlr-randr brightnessctl gammastep gammastep-indicator \
	swaybg swayidle swaylock swayimg imv libfreeimage3 xdg-desktop-portal-wlr \
	hypridle hyprlock hyprpicker hyprshot hyprland-bash-completion xdg-desktop-portal-hyprland hyprwayland-scanner \
	hyprland-devel cmake meson cpio \
	swayidle-bash-completion swaylock-bash-completion wl-clipboard-bash-completion \
	aria2 fastfetch jq stow zsync \
	git git-core git-email libsixel-utils sl \
	python312 \
	python311-pyxdg python311-pipx python311-yt-dlp \
	python311-html5lib python311-beautifulsoup4 python311-PyQt6 \
	python311-python-lsp-server \
	libopenh264-7 mpv man pavucontrol playerctl \
	flatpak opi poppler-tools xdg-user-dirs qalculate \
	clamav java-22-openjdk podman xsettingsd \
	bleachbit kitty pcmanfm-qt qterminal qps sqlitebrowser NetworkManager-applet \
	fuse \
	lxqt-wayland-session \
	breeze6 kdeconnect-kde polkit-kde-agent-6  \
	kvantum-manager kvantum-themes lxqt-config nwg-look qt6ct

	# dolphin kdialog konsole partitionmanager kde-cli-tools6 \
	# ghostwriter systemsettings6 \
	# plasma6-systemmonitor diskmonitor \
	# patterns-kde-kde_plasma


# sudo zypper addrepo --refresh   https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed   snappy
# sudo zypper --gpg-auto-import-keys refresh
# sudo zypper dup --from snappy
# sudo zypper install snapd
# sudo systemctl enable --now snapd
# sudo systemctl enable --now snapd.apparmor

# sudo snap install bash-language-server --classic
