{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.gnome.gdm;
in {
  config = mkIf cfg.enable {
    security.pam.services.gdm.enableGnomeKeyring = true;

    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      libinput.enable = true;
      excludePackages = [pkgs.xterm];
    };
  };
}
