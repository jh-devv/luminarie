{
  pkgs,
  config,
  ...
}: let
  cfg = config.gtk;
in {
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
  home.file.".themes/Catppuccin-Mocha-Standard-Lavender-Dark".source = "${cfg.theme.package}/share/themes/${cfg.theme.name}";
  home.file.".icons/Papirus-Dark".source = "${cfg.iconTheme.package}/share/icons/${cfg.iconTheme.name}";

  xdg.dataFile."flatpak/overrides/global".source = (pkgs.formats.ini {}).generate "global" {
    Context.filesystems = "~/.icons:ro;~/.themes:ro;/nix/store/:ro";
    Environment = {
      GTK_THEME = cfg.theme.name;
      ICON_THEME = cfg.iconTheme.name;
    };
  };
}
