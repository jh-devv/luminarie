{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  inherit (config) gtk;
  cfg = config.modules.home.desktop.session.cosmic;
in {
  config = mkIf cfg.enable {
    gtk = {
      enable = true;

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      theme = {
        name = "catppuccin-mocha-lavender-standard";
        package = pkgs.catppuccin-gtk.override {
          accents = ["lavender"];
          variant = "mocha";
        };
      };
    };

    home = {
      pointerCursor = {
        name = "catppuccin-mocha-lavender-cursors";
        package = pkgs.catppuccin-cursors.mochaLavender;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      file = {
        ".themes/catppuccin-mocha-lavender-standard".source = "${gtk.theme.package}/share/themes/${gtk.theme.name}";
        ".icons/Papirus-Dark".source = "${gtk.iconTheme.package}/share/icons/${gtk.iconTheme.name}";
      };
    };
    modules.home.services.flatpak.overrides = {
      global = {
        Context.filesystems = "~/.icons:ro;~/.themes:ro;/nix/store/:ro";
        Environment = {
          GTK_THEME = gtk.theme.name;
          ICON_THEME = gtk.iconTheme.name;
        };
      };
    };
  };
}
