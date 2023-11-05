{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.pkgs = {
    gaming = {
        enable = lib.mkEnableOption "gaming pkgs";
    }; generic = {
        enable = lib.mkEnableOption "generic pkgs";
    }; gnome-utils = {
        enable = lib.mkEnableOption "gnome-utils pkgs";
    };
  }
}