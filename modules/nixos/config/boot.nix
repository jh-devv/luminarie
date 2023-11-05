{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos = {
    boot.grub = {
      enable = lib.mkEnableOption "grub";
    };
    boot.greetd = {
      enable = lib.mkEnableOption "greetd window manager";
      windowManager = lib.mkOption {
        type = lib.types.str;
        default = "i3"; # Default window manager
        description = "the window manager to be used with greetd";
    };
  };
  };
}
