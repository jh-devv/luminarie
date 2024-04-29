{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.printing;
in {
  config = mkIf cfg.enable {
    services.printing.enable = true;
  };
}
