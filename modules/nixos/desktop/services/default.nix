{lib, ...}:
with lib; {
  imports = [
    ./gnome
    ./audio.nix
    ./bluetooth.nix
    ./firmware.nix
    ./flatpak.nix
    ./printing.nix
    ./wayland.nix
  ];
}
