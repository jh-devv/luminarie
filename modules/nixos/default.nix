{pkgs, ...}: {
  imports = [
    ./boot
    ./desktop
    ./nix
    ./services
    ./shell
    ./programs
  ];
}
