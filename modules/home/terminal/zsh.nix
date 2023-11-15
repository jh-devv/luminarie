{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.zsh;
in {
  config = lib.mkIf cfg.enable { };
}
