# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{pkgs, ...}: {
  imports = [
    ./boot
    ./core
    ./nix
    ./services
  ];

  # These are basically needed :3 (so you don't lock yourself out!)
  environment.systemPackages = with pkgs; [
    curl
    git
    just
    man-pages
    vim
    wget
  ];
}
