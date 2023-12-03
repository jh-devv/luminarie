{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.better-tools;
in {
  config = lib.mkIf cfg.enable { 
    home.packages = with pkgs; [
        ripgrep-all
        fd
        lsd
    ];
    home.shellAliases = {
        ls = "lsd";
        grep = "rga";
    };
    };
}
