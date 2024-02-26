{pkgs, ...}: {
  imports = [
    ./boot
    ./core
    ./desktop
    ./nix
    ./services
    ./programs
  ];
}
