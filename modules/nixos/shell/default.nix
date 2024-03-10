{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.shell;
in {
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf
      ("zsh" == cfg)
      {
        environment.shells = with pkgs; [zsh];
        programs.zsh.enable = true;
      })
  ];
}
