{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  gtk = config.gtk;
  cfg = config.modules.home.desktop;
in {
  config = mkIf ("hyprland" == cfg.session) {
    gtk = {
      enable = true;

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      theme = {
        name = "Catppuccin-Mocha-Standard-Lavender-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["lavender"];
          variant = "mocha";
        };
      };
    };

    # Global cursor, applied to GTK as well
    home.pointerCursor = {
      name = "Catppuccin-Mocha-Lavender-Cursors";
      package = pkgs.catppuccin-cursors.mochaLavender;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };

    # This could probably be done with XDG theme directories uwu
    home.file.".themes/Catppuccin-Mocha-Standard-Lavender-Dark".source = "${gtk.theme.package}/share/themes/${gtk.theme.name}";
    home.file.".icons/Papirus-Dark".source = "${gtk.iconTheme.package}/share/icons/${gtk.iconTheme.name}";

    xdg.dataFile."flatpak/overrides/global".source = (pkgs.formats.ini {}).generate "global" {
      Context.filesystems = "~/.icons:ro;~/.themes:ro;/nix/store/:ro";
      Environment = {
        GTK_THEME = gtk.theme.name;
        ICON_THEME = gtk.iconTheme.name;
      };
    };
  };
}
