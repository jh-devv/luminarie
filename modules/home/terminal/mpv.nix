{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.terminal;
in {
  config = mkIf cfg.mpv.enable {
    programs.mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [mpris];
    };
    home = {
      packages = with pkgs; [playerctl cava];
      shellAliases = {
        mpvm = "mpv --vf=scale=350:-1 --loop-playlist=inf --shuffle";
      };
    };
    services.mpris-proxy.enable = true;
  };
}
