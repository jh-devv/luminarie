{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos = {
    boot.grub = {
      enable = lib.mkEnableOption "grub";
    };
  };
  };
}
