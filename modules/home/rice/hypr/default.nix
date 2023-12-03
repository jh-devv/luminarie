{ self, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.rice.hyprland;
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      preload = ${wallpaper}
    '';
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        source = builtins.toString ./theme.conf;
      };
      extraConfig = builtins.readFile ./hyprland.conf;
      };
  };
}