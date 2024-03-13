{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    programs.rofi = {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = ./theme.rasi;
    };

    home.packages = [pkgs.rofi-power-menu];
  };
}
