{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.tmux;
in {
  config = lib.mkIf cfg.enable { 
    programs.tmux = {
        enable = true;
        plugins = with pkgs; [
            tmuxPlugins.better-mouse-mode
        ];
        shell = "${pkgs.zsh}/bin/zsh";
        };
    };
}
