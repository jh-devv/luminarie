{inputs, ...}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    luminara = nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./luminara
        ../modules/nixos
        ../modules/nixos/hyprland
        ../modules/nixos/programs/gaming.nix
        ../modules/nixos/services/gnome.nix
      ];
    };
  };
}
