{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf cfg.logseq.enable {
    home.packages = with pkgs; [logseq];
  };
}
