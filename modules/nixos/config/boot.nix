{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos = {
    boot.grub = {
      enable = lib.mkEnableOption "Grub";
    };
    boot.gdm = {
      enable = lib.mkEnableOption "GDM";
      windowManager = lib.mkOption {
        type = lib.types.package;
        description = "The window manager to be used with gdm";
    };
    };
  };
}
