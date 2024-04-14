{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf cfg.fractal.enable {
    home.packages = with pkgs; [fractal];
  };
}
