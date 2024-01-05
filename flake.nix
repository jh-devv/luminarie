{
  description = "NixOS and Home Manager configuration for luminara";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      flake = {
        overlays = import ./overlays {inherit inputs;};

        nixosConfigurations = {
          luminara = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
              ./modules/nixos
              ./hosts/luminara
            ];
          };
        };

        homeConfigurations = {
          "jh-devv@luminara" = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
            extraSpecialArgs = {inherit inputs;};
            modules = [
              ./modules/home
              ./users/jh-devv
            ];
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
