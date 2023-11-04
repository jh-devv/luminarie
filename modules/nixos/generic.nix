{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.pkgs.generic = {
    enable = lib.mkEnableOption "generic pkgs";
  };

}