{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nixos.programs.gamemode;
in {
  config = mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [proton-ge-bin];
      };
      gamemode.enable = true;
    };
  };
}
