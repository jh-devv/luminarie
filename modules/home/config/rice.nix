{ lib, config, inputs, ... }:
{
  options.jh-devv.home.rice = {
    theme.gtk = {
      enable = lib.mkEnableOption "GTK";
    };
    theme.qt = {
      enable = lib.mkEnableOption "QT";
    };
    rofi.enable = lib.mkEnableOption "Rofi";
    hyprland.enable = lib.mkEnableOption "Hyprland";
    legacy.enable = lib.mkEnableOption "Legacy Dotfiles";
  };
}