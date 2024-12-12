#!/usr/bin/env bash

### Try
# pipx install trash-cli
# html-xml-utils
#  git-daemon git-gui gitk git-web python311-mutagen python311-pycryptodomex python311-websockets yad
#  python: plyer: not found, python311-python-for-android??
# clipman

# nwg-hello: python311-build python311-installer python311-whee

# ignis:

### installed for compiling
# wayland-logout:
# wtw:
# SwayOSD: sassc
# sfwbar: gtk3-devel libjson-c-devel gtk-layer-shell-devel wayland-protocols-devel
# walker: gtk4-layer-shell: vala gtk-doc
# fabric widgets: gobject-introspection gobject-introspection-devel python311-loguru python311-devel librsvg-devel webkit2gtk3-devel typelib-1_0-DbusmenuGtk3-0_4 typelib-1_0-Dbusmenu-0_4
# anyrun:
# onagre:
# sweep-rs/chronicler:
# cthulock llvm18-devel clang18-devel pam-devel
# wf-recorder/wl-screenrec: ffmpeg-7-libavformat-devel ffmpeg-7-libavutil-devel ffmpeg-7-libavcodec-devel ffmpeg-7-libavfilter-devel ffmpeg-7-libavdevice-devel libpulse-devel pipewire-devel
# pipline: clapper-devel

# hyprland plugins: Mesa-libGLESv3-devel aquamarine-devel hyprlang-devel
# OpenCL: intel-opencl
# Adwaita for python: typelib-1_0-Graphene-1_0 typelib-1_0-Gtk-4_0 libadwaita-1-0 libadwaita-lang libadwaita-devel
# ironbar: libluajit-5_1-2

# distrobox: curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
#	curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/uninstall | sudo sh
#	then uninstall podman with zypper

### precompiled from github:
# amp app ddh eget flavours handlr hck htmlq ianny ironbar lemminx-linux matugen nomino rgr rink rmpc rsftch rustic satty scout suckit tinted-builder-rust tinty walker wthrr xh xsv ytdlp-gui

sudo zypper in labwc hyprland patterns-base-base \
    pop-launcher rofi-wayland wob \
    greetd \
    libnotify-tools SwayNotificationCenter waycheck \
	wev lswt wtype wlrctl wl-clipboard \
	grim slurp wayshot waysip \
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
	bleachbit kitty konsole pcmanfm-qt qterminal qps sqlitebrowser NetworkManager-applet \
	fuse \
	breeze6 kdeconnect-kde polkit-kde-agent-6  \
	kvantum-manager kvantum-themes lxqt-config nwg-look qt6ct

	# dolphin kdialog partitionmanager kde-cli-tools6 \
	# ghostwriter systemsettings6 \
	# plasma6-systemmonitor diskmonitor \
	# patterns-kde-kde_plasma

	# Icons: papirus-icon-theme moka-icon-theme suru-icon-theme tela-icon-theme

# wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# navi depends on fzf (auto installed)
brew install bat bottom broot diskus dust dysk fd fselect git-delta gping grex \
	helix howdoi hyperfine jaq jless jnv lsd macchina mcfly mprocs navi onefetch \
	ouch pastel procs ripgrep rga rust-analyzer rust-parallel starship sd \
	tealdeer tokei trippy vivid zoxide
	# micro
	## Tap: diskonaut hck tinted-builder-rust tinty scout


pipx install animdl cute-sway-recorder gallery-dl lightnovel-crawler Trackma[curses,trackers] waypaper ytcc

cargo install anyrun gengir nucleo rebos runiq rusti-cal rustlings toipe trashy wayout wl-screenrec xcp

flatpak install -u \
	org.kde.ark \
	org.kde.elisa \
	org.kde.falkon \
	org.kde.filelight \
	org.kde.gwenview \
	org.kde.kate \
	org.kde.ktorrent \
	org.kde.okular \
	org.mozilla.firefox \
	org.mozilla.Thunderbird \
	org.videolan.VLC
	# org.kde.akregator
	# org.kde.ghostwriter
	# org.kde.kcalc
	# org.kde.marknote
	# org.learningequality.Kolibri


# sudo zypper addrepo --refresh   https://download.opensuse.org/repositories/system:/snappy/openSUSE_Tumbleweed   snappy
# sudo zypper --gpg-auto-import-keys refresh
# sudo zypper dup --from snappy
# sudo zypper install snapd
# sudo systemctl enable --now snapd
# sudo systemctl enable --now snapd.apparmor

# sudo snap install bash-language-server --classic
