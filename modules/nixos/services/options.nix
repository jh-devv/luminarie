{lib, ...}:
with lib; {
  options.modules.nixos.services = {
    hardware = genAttrs ["audio" "bluetooth" "i2c" "smart-card" "printing"] (k: {enable = mkEnableOption k;});
    containers = genAttrs ["flatpak"] (k: {enable = mkEnableOption k;});
    desktop-manager = genAttrs ["gdm"] (k: {enable = mkEnableOption k;});
    keyring = genAttrs ["gnome"] (k: {enable = mkEnableOption k;});
    polkit = genAttrs ["gnome"] (k: {enable = mkEnableOption k;});
  };
}
