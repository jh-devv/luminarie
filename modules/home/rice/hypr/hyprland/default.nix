{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.rice.hyprland;
in {
  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
    enable = true;
    settings = {
            source = builtins.toString ./theme.conf;
        };
    extraConfig = builtins.readFile ./hyprland.conf;
    };
  };
}