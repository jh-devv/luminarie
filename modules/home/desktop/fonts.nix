{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.fonts;
in {
  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
    ];
  };
}
