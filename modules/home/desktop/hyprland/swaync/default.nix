{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    xdg.configFile."swaync/style.css".source = ./css/style.css;
  };
}
