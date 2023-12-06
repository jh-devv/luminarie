{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.rice.rofi;
in {
  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = ./theme.rasi;
    };

    home.packages = [ pkgs.rofi-power-menu ];
  };
}