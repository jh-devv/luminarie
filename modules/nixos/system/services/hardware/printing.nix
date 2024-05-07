{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services.printing;
in {
  config = mkIf cfg.enable {
    services.printing.enable = true;
  };
}
