{ lib, config, ... }:
{
  options.jh-devv.home = {
    theme.gtk = {
      enable = lib.mkEnableOption "gtk theme";
    };
    theme.qt = {
      enable = lib.mkEnableOption "qt theme";
    };
  };
}