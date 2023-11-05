{ inputs, options, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.nixos.pkgs.gaming;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
        gamemode
        gamescope
        mangohud
      ];

  programs.steam.enable = true;
  programs.gamemode.enable = true;

  };
}
