{lib, ...}:
with lib; {
  imports = [
    ./services
    ./hyprland
    ./steam.nix
  ];

  options.modules.nixos.desktop =
    genAttrs ["steam"] (k: {enable = mkEnableOption k;})
    // {
      session = mkOption {
        example = ["hyprland"];

        type = types.enum ["hyprland" null];
        description = ''
          The session you want to use (DE or WM with everything around)
          Make sure to also enable it from Home Manager for the full experience!
        '';
      };

      services =
        genAttrs ["audio" "flatpak" "bluetooth" "firmware" "gnome.xdg" "gnome.keyring" "gnome.polkit" "gnome.gdm" "printing" "wayland"] (k: {enable = mkEnableOption k;})
        // {
          gnome = {
            gdm.enable = mkEnableOption "gnome gdm";
            keyring.enable = mkEnableOption "gnome keyring";
            polkit.enable = mkEnableOption "gnome polkit";
            xdg.enable = mkEnableOption "gnome xdg";
          };
        };
    };
}
