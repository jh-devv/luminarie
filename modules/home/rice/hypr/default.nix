{ self, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.rice;
in {
  config = lib.mkIf cfg.hyprland.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      preload = ${cfg.wallpaper}
      wallpaper = DP-2,${cfg.wallpaper}
    ''; #TODO: Change to variable
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        source = builtins.toString ./theme.conf;
      };
      extraConfig = builtins.readFile ./hyprland.conf;
      };
  };
}