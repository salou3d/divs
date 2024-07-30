{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
  (self: super: {
    labwc = super.labwc.overrideAttrs(_: rec {
#      postInstall = let
#        qtileSession = ''
#        [Desktop Entry]
#        Name=Qtile Wayland
#        Comment=Qtile on Wayland
#        Exec=qtile start -b wayland
#        Type=Application
#        '';
#        in
#        ''
#      mkdir -p $out/share/wayland-sessions
#      echo "${qtileSession}" &gt; $out/share/wayland-sessions/qtile.desktop
#      '';
      passthru.providedSessions = [ "labwc" ];
    });
  })
];

services.xserver.displayManager.sessionPackages = [ pkgs.labwc ];
}
