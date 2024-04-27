{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.packages;
in {
  imports = [
    ./firefox.nix
  ];
  home.packages =
    lib.optional cfg.fractal.enable pkgs.fractal
    ++ lib.optional cfg.code.enable pkgs.vscode
    ++ lib.optional cfg.logseq.enable pkgs.logseq;
}
