{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.programs;
in {
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf
      (builtins.elem "steam" cfg)
      {
        environment.systemPackages = with pkgs; [
          gamemode
          gamescope
          mangohud
          pkgsi686Linux.gperftools
        ];

        programs = {
          steam.enable = true;
          gamemode.enable = true;
        };
      })
  ];
}
