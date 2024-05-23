{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    services.swaync = {
      enable = true;
      style = ./css/style.css;
    };
  };
}
