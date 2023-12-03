{ lib, config, inputs, ... }:
{
  options.jh-devv.home.rice = {
    theme.gtk = {
      enable = lib.mkEnableOption "gtk theme";
    };
    theme.qt = {
      enable = lib.mkEnableOption "qt theme";
    };
    rofi.enable = lib.mkEnableOption "rofi theme";
    hyprland.enable = lib.mkEnableOption "hyprland";
    legacy.enable = lib.mkEnableOption "deployment of legacy dots";

    wallpaper = lib.mkOption {
      type = lib.types.path;
      default = builtins.toString "${inputs.self}/assets/city.png";
    };
  };
}