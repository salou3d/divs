# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./labwc-overlay.nix
      ./labwc.nix
#      ./nix-alien.nix
    ];


  # Bootloader.
#  boot.loader.systemd-boot.enable = true;
#  boot.loader.efi.canTouchEfiVariables = true;
boot.loader.grub = {
enable = true;
device = "nodev";
efiSupport = true;
    useOSProber = true;
  };

  networking.hostName = "sal-hpnb"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

#  programs.xwayland.enable = true;
#  hardware.opengl.enable = true;
#  programs.sway.enable = true;
  programs.labwc.enable = true;
#  programs.regreet = {
#    enable = true;
#  };

#  programs.hyprland = {
#    enable = true;
#    xwayland.enable = true;
#  };
  security.pam.services.swaylock = {}; 


  services.xserver = {
    enable = true;
    autorun = true;
    updateDbusEnvironment = true;
    gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
    windowManager.openbox.enable = true;
    libinput = {
      enable = true;
      touchpad.tapping = true;
    };

    displayManager.lightdm.enable = true;
    displayManager.lightdm.greeters.slick = {
       enable = true;
      theme.name = "Breeze-Dark";
      iconTheme.name = "breeze-dark";
      cursorTheme.name = "breeze";
    };

  };

  # Configure keymap in X11
  services.xserver = {
    layout = "fr,ara";
    xkbVariant = "azerty,";
    xkbOptions = "grp:win_space_toggle";
    exportConfiguration = true;
  };

  services = {
    dbus.enable = true;
    udisks2.enable = true;
    accounts-daemon.enable = true;
    power-profiles-daemon.enable = true;
    gnome.gnome-keyring.enable = true;
    autorandr.enable = true;
    upower.enable = true;
    gvfs.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    mpd.enable = true;
    # printing.enable = true;
    # system-config-printer.enable = true;
  };

  security.pam.services = {
    login.enableGnomeKeyring = true;
    sshd.enableGnomeKeyring = true;
    lightdm.enableGnomeKeyring = true;
#     login.enableKwallet = true;
  };

  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.xfce.power.backlight-helper"
           && subject.isInGroup("users")
           )
        {
          return polkit.Result.YES;
        }
      });
      '';
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    extraConfig = ''
      DefaultTimeoutStopSec=10s
    '';
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.salo = {
    isNormalUser = true;
    description = "Sal OB Oued";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };

  users.extraUsers.salo.extraGroups = [ "audio" "video" ];

  users.users.salw = {
    isNormalUser = true;
    description = "Sal WL Oued";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  users.extraUsers.salw.extraGroups = [ "audio" "video" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget

  # libnma
    ntfs3g git fzf bc gnumake lm_sensors jq file
    htop btop poppler_utils p7zip aria
    aircrack-ng bully pixiewps
    (python311.withPackages (
      ps: with ps; [
       pyxdg pip requests html5lib beautifulsoup4 plyer kivy docutils watchdog
       jedi GitPython six matplotlib configparser pyqt5 pygobject3 python-bidi
       arabic-reshaper xlib ueberzug fire pulsectl
       ]
      )
    )
    libnotify dunst distrobox virt-manager
    dconf polkit_gnome gcc openjdk
    playerctl rofi yad pavucontrol process-viewer brightnessctl
    yt-dlp ytcc mpv mpc-cli
    xfce.xfce4-battery-plugin xfce.xfce4-power-manager xfce.exo xfce.xfce4-settings xfce.xfce4-terminal xfce.xfce4-taskmanager
    xfce.thunar xfce.thunar-volman xfce.thunar-archive-plugin xfce.thunar-media-tags-plugin
    dolphin libsForQt5.dolphin-plugins ark gwenview okular pcmanfm
    libsForQt5.kdeconnect-kde libsForQt5.kate
    libsForQt5.breeze-gtk libsForQt5.breeze-icons libsForQt5.breeze-qt5
    adwaita-qt
    font-manager dfeet d-spy bleachbit sqlitebrowser
    eclipses.eclipse-java

    #niri
    #uget uget-integrator
    #persepolis

  ];

  environment.localBinInPath = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

#  fileSystems."/nix" = {
#    device = "/dev/disk/by-label/NixStore";
#    fsType = "ext4";
#  };

  fileSystems."/media/Apps" = {
    device = "/dev/disk/by-label/Apps";
    fsType = "ntfs";
  };

  fileSystems."/media/SDisque" = {
    device = "/dev/disk/by-label/SDisque";
    fsType = "ntfs";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    # pkgs.xdg-desktop-portal-gtk
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];

  };

  xdg = {
    sounds.enable = true;
    menus.enable = true;
    icons.enable = true;
    mime.enable = true;
    autostart.enable = true;
  };

  services.logind = {
    lidSwitch = "suspend";
    extraConfig = "IdleAction=lock\nIdleActionSec=60\nHandlePowerKey=suspend\nHan>";
  };

  services.clamav = {
    daemon = {
      enable = false;
    };
    updater = {
      enable = true;
      frequency = 1;
      interval = "daily";
    };
  };

#  services.redshift = {
#    enable = true;
#    package = pkgs.redshift;
#    executable = "/bin/redshift-gtk";
#    temperature.night = 3600;
#    temperature.day = 3600;

#  };

#  location = {
#    provider = "manual";
#    latitude = 35.7808;
#    longitude = -5.8176;
#  };

  sound.enable = true;
  nixpkgs.config = {
    pulseaudio = true;
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  programs = {
    xfconf.enable = true;
    partition-manager.enable = true;
    nix-ld.enable = true;
#    virt-manager.enable = true;

     

  };

  qt = {
    enable = true;
    style = "breeze";
    platformTheme = "qt5ct";
  };
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
#    TERM = "xfce4-terminal"; # is ther a better way??
  };

  fonts = {
    enableDefaultPackages = true;
    fontconfig = {
      enable = true;
      hinting.enable = false; # false for HiDPI
    };

#    fonts.fontDir.enable = true;
    packages = with pkgs; [
#        cantarell-fonts
#        fira-code
#        fira-code-symbols
#        dina-font
#        joypixels
#        carlito  # like calibri
        noto-fonts
        noto-fonts-emoji
	noto-fonts-monochrome-emoji
	font-awesome
	noto-fonts-cjk-sans
	noto-fonts-lgc-plus
	swaycons
        (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" "Noto" ]; })
    ];
  };

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  powerManagement.enable = true;
  virtualisation.podman.enable = true;
#  virtualisation.waydroid.enable = true;
  virtualisation.libvirtd.enable = true;
  system.copySystemConfiguration = true;

}
