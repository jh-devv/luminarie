{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.hardware.smart-card;
in {
  config = mkIf cfg.enable {
    services = {
      pcscd.enable = true;
    };
  };
}
