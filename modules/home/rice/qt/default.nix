{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.jh-devv.home.rice.theme.qt;
in {
  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "qtct";
      style = {
        package = pkgs.catppuccin-kvantum.override {
          accent = "Lavender";
          variant = "Mocha";
        };
        name = "kvantum";
      };
    };

    home.packages = with pkgs; [
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
    ];

    xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin-Mocha-Lavender";
    };
  };
}
