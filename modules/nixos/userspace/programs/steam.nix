{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nixos.programs.steam;
in {
  config = mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;
        extraCompatPackages = with pkgs; [proton-ge-bin];
      };
      gamemode.enable = true;
    };
    environment.systemPackages = with pkgs; [lutris];
  };
}
