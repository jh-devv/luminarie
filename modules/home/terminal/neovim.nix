{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.nvim;
in {
  config = lib.mkIf cfg.enable { 
    programs.neovim = {
        enable = true;
    };
    };
}
