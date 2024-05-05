{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.shell.subtitutes;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      coreutils
      gnugrep
      gh
      git
      lsd
      ripgrep-all
      nitch
      trash-cli
    ];
    home.shellAliases = {
      rm = "trash-put";
      ls = "lsd";
    };
  };
}
