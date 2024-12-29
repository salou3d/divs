#!/usr/bin/env bash

### Try
# html-xml-utils
# git-daemon git-gui gitk git-web yad

### Compiled:
# labwc-menu-generator labwc-tweaks onagre swayosd sweep
# vigiland wayland-logout wleave wlopm wtw
# eww (elkowar/eww)

### Installed for compiling
# deps for compliations:
# SwayOSD: sassc gtk4-layer-shell
# ironbar: luajit
# wtw: fcft tllist
# walker : libvips
# satty: libadwaita
# wf-recorder/wl-screenrec: ffmpeg-7-libavformat-devel ffmpeg-7-libavutil-devel ffmpeg-7-libavcodec-devel ffmpeg-7-libavfilter-devel ffmpeg-7-libavdevice-devel libpulse-devel pipewire-devel

### Precompiled from github:
# amp app clerk ddh dnote dnote-tui eget flavours handlr hck htmlq hyprgui hyprlauncher
# hyprwall ianny ig ironbar lemmeknow lemminx-linux matugen micro nomino rgr rink rmpc
# rsftch rust-analyzer rustic satty sk suckit tinted-builder-rust tinty tjournal walker
# wthrr wttrbar xh xsv ytdlp-gui

### Icons: papirus-icon-theme moka-icon-theme suru-icon-theme tela-icon-theme
# wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh

### distrobox:
# curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh
# curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/uninstall | sudo sh
# then uninstall podman with package manager

### AppImages:
# LibreOffice
# Zen browser


### Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# navi depends on fzf (auto installed)
brew install bat bottom broot csvlens diskus dua-cli dust dysk fd fselect fzf \
	git-delta gping grex helix howdoi hyperfine jaq jless jnv lsd macchina mcfly \
	mprocs navi onefetch ouch pastel procs ripgrep rga rust-analyzer rust-parallel \
	sd starship tealdeer tokei trippy vivid yazi zoxide \
	bash-language-server python-lsp-server shellcheck vscode-langservers-extracted
	# micro
	## Tap: diskonaut hck tinted-builder-rust tinty scout


### Python pipx
# cute-sway-recorder waypaper
pipx install gallery-dl yt-dlp ytcc


### Rust cargo
cargo install anyrun felix gengir rebos runiq rusti-cal rustlings toipe \
	trashy wayout wayshot waysip xcp # wl-screenrec


### Flatpaks
flatpak install -u \
	org.kde.ark \
	org.kde.elisa \
	org.kde.falkon \
	org.kde.filelight \
	org.kde.gwenview \
	org.kde.ghostwriter \
	org.kde.kate \
	org.kde.ktorrent \
	org.kde.KStyle.Kvantum \
	org.kde.okular \
	org.mozilla.firefox \
	org.mozilla.Thunderbird
	# io.github.zen_browser.zen
	# org.videolan.VLC
	# org.kde.akregator
	# org.kde.klevernotes
	# org.kde.marknote
	# org.qownnotes.QOwnNotes
	# org.kde.kcalc
	# org.kde.marknote
	# br.eng.silas.qpdftools
	# io.github.amit9838.mousam
	# io.github.giantpinkrobots.varia

