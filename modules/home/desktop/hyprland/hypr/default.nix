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
  imports = [
    ./hyprpaper
  ];
  config = mkIf ("hyprland" == cfg.session) {
    home.packages = with pkgs; [
      blueman
      networkmanagerapplet
      pavucontrol
      swaynotificationcenter
      hyprpicker
      wl-clipboard
      playerctl
      waybar

      (inputs.hyprland-contrib.packages.${system}.grimblast)
    ];

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
