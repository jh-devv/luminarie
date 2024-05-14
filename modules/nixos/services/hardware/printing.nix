{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.hardware.printing;
in {
  config = mkIf cfg.enable {
    services.printing.enable = true;
  };
}
