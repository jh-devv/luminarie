{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.home.programs.fractal;
in
{
  options.modules.home = {
    programs =
      genAttrs
        [
          "fractal"
        ]
        (k: {
          enable = mkEnableOption k;
        });
  };
  config = mkIf cfg.enable { home.packages = with pkgs; [ fractal ]; };
}
