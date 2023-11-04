{ lib, config, ... }:
{
  options.jh-devv.home.legacy.enable = lib.mkEnableOption "deployment of legacy dots";
}