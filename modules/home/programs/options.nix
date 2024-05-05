{
  lib,
  pkgs,
  ...
}:
with lib; {
  options.modules.home.programs =
    # The snippet below generates mkEnableOptions for the listed packages.
    # Though, you can still add more complex options for some packages using //.
    genAttrs ["fractal" "kitty" "mpv" "nautilus" "neovim" "newsboat" "text-editor" "vscode"] (k: {enable = mkEnableOption k;})
    // {
      firefox = {
        enable = mkEnableOption "firefox";
        theme.package = mkOption {
          example = pkgs.firefox-gnome-theme;

          type = types.nullOr types.package;
          default = pkgs.firefox-gnome-theme;
          description = ''
            An user theme you want to apply
          '';
        };
      };
    };
}
