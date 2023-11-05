{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.pkgs.gnome-utils = {
    enable = lib.mkEnableOption "gnome-utils pkgs";
  };

}