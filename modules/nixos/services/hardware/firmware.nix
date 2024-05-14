{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.hardware.firmware;
in {
  config = mkIf cfg.enable {
    services = {
      pcscd.enable = true;
      fwupd.enable = true;
    };
  };
}
