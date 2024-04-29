{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.gnome.keyring;
in {
  config = mkIf cfg.enable {
    services = {
      dbus.packages = [pkgs.gcr];
      gnome.gnome-keyring.enable = true;
    };

    programs = {
      dconf.enable = true;
      seahorse.enable = true;
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
