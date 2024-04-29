{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.fractal;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [fractal];
  };
}
