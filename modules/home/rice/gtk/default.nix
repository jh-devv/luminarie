{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.jh-devv.home.rice.theme.gtk;
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
        name = "Papirus-Dark";
      };
      theme = {
        name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["lavender"];
          variant = "mocha";
        };
      };
    };

    home.pointerCursor = {
      package = pkgs.catppuccin-cursors.mochaLavender;
      name = "Catppuccin-Mocha-Lavender-Cursors";
    };

    # This could probably be done with XDG theme directories uwu
    home.file.".themes/Catppuccin-Mocha-Standard-Lavender-Dark".source = "${pkgs.catppuccin-gtk.override {
      accents = ["lavender"];
      variant = "mocha";
    }}/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark";
    home.file.".icons/Papirus-Dark".source = "${pkgs.catppuccin-papirus-folders}/share/icons/Papirus-Dark/";

    xdg.dataFile."flatpak/overrides/global".source = (pkgs.formats.ini {}).generate "global" {
      Context.filesystems = "~/.icons:ro;~/.themes:ro;/nix/store/:ro";
      Environment = {
        GTK_THEME = "Catppuccin-Mocha-Standard-Lavender-Dark";
        ICON_THEME = "Papirus-Dark";
      };
    };
  };
}
