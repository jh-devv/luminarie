{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.pkgs.gaming = {
    enable = lib.mkEnableOption "gaming pkgs";
  };

}