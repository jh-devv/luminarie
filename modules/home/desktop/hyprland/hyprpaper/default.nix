{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = map (m: m.wallpaper) cfg.displays;
        wallpaper = map (m: "${m.name},${m.wallpaper}") cfg.displays;
      };
    };
  };
}
