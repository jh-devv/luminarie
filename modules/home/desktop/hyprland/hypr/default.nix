{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf ("hyprland" == cfg.session) {
    home.packages = with pkgs; [
      blueman
      networkmanagerapplet
      pavucontrol
      swaylock-effects
      swaynotificationcenter
      hyprpicker
      wl-clipboard
      playerctl

      hyprpaper
      waybar

      (inputs.hyprland-contrib.packages.${system}.grimblast)
    ];

    xdg.configFile."hypr/hyprpaper.conf".text = ''
      ${strings.concatLines (map (m: "preload = ${m.wallpaper}") cfg.displays)}
      ${strings.concatLines (map (m: "wallpaper = ${m.name},${m.wallpaper}") cfg.displays)}
    '';

    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        monitor = map (m: "${m.name},${m.hyprland}") cfg.displays;
        workspace = lists.concatMap (m: map (w: "${toString w},monitor:${m.name}") m.workspaces) cfg.displays;

        source = builtins.map builtins.toString [
          ./startup.conf
          ./theme.conf
          ./decoration.conf
          ./other.conf
          ./windowrules.conf
          ./binds.conf
        ];
      };
    };
  };
}
