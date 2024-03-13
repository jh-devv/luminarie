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
  config = mkIf (cfg.session == "hyprland") {
    home.packages = with pkgs; [
      hyprpaper
    ];

    xdg.configFile."hypr/hyprpaper.conf".text = ''
      ${strings.concatLines (map (m: "preload = ${m.wallpaper}") cfg.displays)}
      ${strings.concatLines (map (m: "wallpaper = ${m.name},${m.wallpaper}") cfg.displays)}
    '';
  };
}
