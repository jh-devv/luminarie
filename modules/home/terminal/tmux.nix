{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.terminal;
in {
  config = mkIf (cfg.tmux.enable) {
    programs.tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
      ];
      shell = "${pkgs.zsh}/bin/zsh";
    };
  };
}
