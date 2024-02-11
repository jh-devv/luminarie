{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home;
in {
  config = mkIf ("hyprland" == cfg.session) {
    programs.rofi = {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = ./theme.rasi;
    };

    home.packages = [pkgs.rofi-power-menu];
  };
}
