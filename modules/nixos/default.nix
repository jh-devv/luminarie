# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{pkgs, ...}:{
  imports = [ 
    ./config
    ./boot
    ./hyprland
    ./programs
    ./services
  ];

  # These are basically needed :3
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    just
  ];
}
