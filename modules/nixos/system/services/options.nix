{lib, ...}:
with lib; {
  options.modules.nixos.services =
    genAttrs ["audio" "flatpak" "bluetooth" "firmware" "gnome.xdg" "gnome.keyring" "gnome.polkit" "gnome.gdm" "printing"] (k: {enable = mkEnableOption k;})
    // {
      gnome = {
        gdm.enable = mkEnableOption "gnome gdm";
        keyring.enable = mkEnableOption "gnome keyring";
        polkit.enable = mkEnableOption "gnome polkit";
        xdg.enable = mkEnableOption "gnome xdg";
      };
    };
}
