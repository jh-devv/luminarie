{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.theme;
in {
  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = "qtct";
      style = {
        package = pkgs.catppuccin-kvantum.override {
          variant = "Mocha";
          accent = "Lavender";
        };
        name = "kvantum";
      };
    };

    home.packages = with pkgs;[
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
      qt6.qtwayland
      libsForQt5.qt5.qtwayland
    ];

    xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin-Mocha-Lavender";
    };

  };
}
