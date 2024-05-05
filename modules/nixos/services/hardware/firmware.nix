{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.firmware;
in {
  config = mkIf cfg.enable {
    services = {
      pcscd.enable = true;
      fwupd.enable = true;
    };
  };
}
