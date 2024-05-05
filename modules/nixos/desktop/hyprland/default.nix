{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    modules.nixos = {
      services = {
        gnome = {
          gdm.enable = true;
          keyring.enable = true;
          polkit.enable = true;
        };
        audio.enable = true;
        bluetooth.enable = true;
        firmware.enable = true;
        flatpak.enable = true;
        printing.enable = true;
      };
      programs.wayland.enable = true;
    };
    programs.hyprland = {
      enable = true;
    };
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
