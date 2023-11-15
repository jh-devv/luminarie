{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.rice.rofi;
in {
  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [ rofi-calc rofi-emoji ];
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = ./theme.rasi;
    };

    # for rofi-emoji to insert emojis directly
    home.packages = [ pkgs.xdotool ];
  };
}