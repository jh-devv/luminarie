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
        hardware = {
          audio.enable = true;
          bluetooth.enable = true;
        };
        keyring.gnome.enable = true;
        polkit.gnome.enable = true;
        desktop-manager.gdm.enable = true;
      };
      programs = {
        wayland.enable = true;
        steam.enable = true;
      };
    };
    programs.hyprland = {
      enable = true;
    };
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
