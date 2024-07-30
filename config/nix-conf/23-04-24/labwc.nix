{ config, lib, pkgs, ...}:
let
  cfg = config.programs.labwc;
in
{
  options.programs.labwc = {
    enable = lib.mkEnableOption (lib.mdDoc "labwc, a wayland stacking compositor based on wlroots");

    package = lib.mkPackageOptionMD pkgs "labwc" { };

  };

  config = let
    finalPackage = pkgs.labwc;
  in
  lib.mkIf cfg.enable {
    environment.systemPackages = [
      finalPackage
    ];

    programs.xwayland.enable = true;
    hardware.opengl.enable = true;
    services.xserver.displayManager.sessionPackages = [ finalPackage ];

    xdg.portal = {
      enable = lib.mkDefault true;
      wlr.enable = lib.mkDefault true;
      config.labwc.default = lib.mkDefault [ "wlr" "gtk" ];
    };
  };
}
