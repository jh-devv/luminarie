{lib, ...}:
with lib; {
  imports = [
    ./nix.nix
    ./shell
    ./boot
    ./desktop
  ];
}
