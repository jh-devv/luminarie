{inputs, ...}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    luminara = nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ../modules/nixos
        ./luminara
      ];
    };
  };
}
