{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.theme.gtk;
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
        package = pkgs.catppuccin-gtk.override {
          accents = ["lavender"];
          variant = "mocha";
        };
      };
    };

    # For flatpaks, kinda gross but works uwuf
    home.file.".themes".source = "${pkgs.catppuccin-gtk.override { accents = ["lavender"]; variant = "mocha"; }}/share/themes";
    home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaLavender}/share/icons/Catppuccin-Mocha-Lavender-Cursors";
  };
}
