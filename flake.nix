{
  description = "NixOS and Home Manager configuration for luminara";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland-contrib,
    ...
  } @ inputs: {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      luminara = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/nixos
          ./hosts/luminara
        ];
      };
    };

    homeConfigurations = {
      "jh-devv@luminara" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./modules/home
          ./users/jh-devv
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
