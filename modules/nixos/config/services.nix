{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.services = {
    enable = lib.mkEnableOption "System Services";
    gnome = {
        enable = lib.mkEnableOption "Gnome Services";
    };
  };
}