{ config, lib, ... }:
with lib;
let
  cfg = config.modules.home.services.mpris-proxy;
in
{
  config = mkIf cfg.enable { services.mpris-proxy.enable = true; };
}
