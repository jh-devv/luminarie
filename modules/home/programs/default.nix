{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.home.programs;
in {
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf
      (builtins.elem "gnome" cfg)
      {
        home.packages = with pkgs; [
          fractal
          todoist
        ];
      })
  ];
}
