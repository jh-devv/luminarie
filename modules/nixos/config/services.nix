{ options, config, lib, pkgs, ... }:
{
  options.jh-devv.nixos.services = {
    enable = lib.mkEnableOption "core services";
  };
}