{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    services.blueman-applet.enable = true;
    services.network-manager-applet.enable = true;
  };
}
