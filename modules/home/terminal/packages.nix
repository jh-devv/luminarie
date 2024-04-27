{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.terminal.packages;
in {
  config = mkMerge [
    (mkIf
      cfg.neovim.enable
      {
        programs.neovim.enable = true;
      })
    (mkIf
      cfg.mpv.enable
      {
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
      })
  ];
}
