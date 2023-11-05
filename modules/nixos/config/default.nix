# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{...}:{
  imports = [ 
    ./boot.nix
    ./hyprland.nix
    ./services.nix
    ./gnome-utils.nix
    ./pkgs.nix
  ];
}
