{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.pkgs = {
    gaming = {
        enable = lib.mkEnableOption "Gaming pkgs";
    }; generic = {
        enable = lib.mkEnableOption "Generic pkgs";
    }; gnome-utils = {
        enable = lib.mkEnableOption "Gnome Utilities";
    };
  };
}