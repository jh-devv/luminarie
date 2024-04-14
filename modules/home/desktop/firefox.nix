{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf cfg.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-wayland;
    };
  };
}
