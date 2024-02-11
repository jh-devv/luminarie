{pkgs, ...}: {
  imports = [
    ./boot
    ./core
    ./desktop
    ./nix
    ./services
    ./programs
  ];

  environment.systemPackages = with pkgs; [
    curl
    git
    just
    man-pages
    vim
    wget
  ];
}
