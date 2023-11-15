{ lib, config, ... }:
{
  options.jh-devv.home.rice = {
    theme.gtk = {
      enable = lib.mkEnableOption "gtk theme";
    };
    theme.qt = {
      enable = lib.mkEnableOption "qt theme";
    };
    rofi.enable = lib.mkEnableOption "rofi theme";
    legacy.enable = lib.mkEnableOption "deployment of legacy dots";
  };
}