{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.theme;
in {
  config = lib.mkIf cfg.enable {
    
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.catppuccin-cursors.mochaLavender;
        name = "Catppuccin-Mocha-Lavender-Cursors";
      };
      iconTheme = {
        package = pkgs.catppuccin-papirus-folders;
        name = "Papirus";
      };
      theme = {
        name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        package = pkgs.unstable.catppuccin-gtk.override {
          accents = ["lavender"];
          variant = "mocha";
        };
      };
    };
  };
}
