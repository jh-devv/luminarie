{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  imports = [
    ./hyprpaper
    ./hyprlock
    ./hypridle
  ];
  config = mkIf (cfg.session == "hyprland") {
    home.packages = with pkgs; [
      blueman
      networkmanagerapplet
      pavucontrol
      swaynotificationcenter
      hyprpicker
      wl-clipboard
      playerctl
      waybar
      grimblast
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

        bind = (mkIf cfg.power.lockscreen.enable) [
          "$mainMod, L, exec, hyprlock"
        ];
      };
    };
  };
}
