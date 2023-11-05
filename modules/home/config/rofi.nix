{ lib, config, ... }:
{
  options.jh-devv.home.rofi.enable = lib.mkEnableOption "rofi theming";
}