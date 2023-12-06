{ self, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home;
in {
  config = lib.mkIf cfg.rice.hyprland.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      ${lib.strings.concatLines (map
        (
          m: "preload = ${m.wallpaper}"
        )
        (cfg.displays))}
      ${lib.strings.concatLines (map
        (
          m: "wallpaper = ${m.name},${m.wallpaper}"
        )
        (cfg.displays))}
    '';
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor =
          map
            (
              m: "${m.name},${m.hyprland}"
          )
          (cfg.displays);
        workspace =
          lib.lists.concatMap
            (
              m: map (w: "${toString w},monitor:${m.name}") (m.workspaces)
            )
          (cfg.displays);
          source = builtins.map builtins.toString [ ./startup.conf ./theme.conf ./decoration.conf ./other.conf ./windowrules.conf ./binds.conf ];
      };
      };
  };
}