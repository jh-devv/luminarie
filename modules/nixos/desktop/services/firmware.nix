{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.firmware;
in {
  config = mkIf cfg.enable {
    services = {
      udev.packages = [pkgs.yubikey-personalization];
      pcscd.enable = true;
      fwupd.enable = true;
    };
  };
}
