{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.rust-cli;
in {
  config = lib.mkIf cfg.enable { 
    home.packages = with pkgs; [
        fd
        lsd
    ];
    home.shellAliases = {
        ls = "lsd";
    };
    };
}
