{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.better-tools;
in {
  config = lib.mkIf cfg.enable { 
    home.packages = with pkgs; [
        fd
        lsd
    ];
    home.shellAliases = {
        ls = "lsd";
        find = "fd --glob";
    };
    };
}
