{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  inherit (config) gtk;
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
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

    home = {
      pointerCursor = {
        name = "Catppuccin-Mocha-Lavender-Cursors";
        package = pkgs.catppuccin-cursors.mochaLavender;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      file = {
        ".themes/Catppuccin-Mocha-Standard-Lavender-Dark".source = "${gtk.theme.package}/share/themes/${gtk.theme.name}";
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
