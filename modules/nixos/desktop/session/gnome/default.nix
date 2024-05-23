{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop;
in {
  config = mkIf (cfg.session == "gnome") {
    modules.nixos = {
      services = {
        keyring.gnome.enable = true;
        polkit.gnome.enable = true;
        desktop-manager.gdm.enable = true;
      };
    };
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
    };
    environment.systemPackages = with pkgs; [gnomeExtensions.appindicator];
    services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };
}
