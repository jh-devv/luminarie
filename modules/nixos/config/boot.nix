{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos = {
    boot.grub = {
      enable = lib.mkEnableOption "grub";
    };
    boot.gdm = {
      enable = lib.mkEnableOption "gdm window manager";
      windowManager = lib.mkOption {
        type = lib.types.package;
        description = "the window manager to be used with gdm";
    };
    };
  };
}
