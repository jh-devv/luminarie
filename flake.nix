{
  description = "NixOS and Home Manager configuration for luminara";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
  {
    packages.x86_64-linux = import ./pkgs inputs.nixpkgs.legacyPackages.x86_64-linux;
    overlays = import ./overlays {inherit inputs;};


    nixosConfigurations = {
      luminara = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos
          ./nixos/hosts/luminara
          ./modules/nixos
        ];
      };
    };

    homeConfigurations = {
      "jh-devv@luminara" = home-manager.lib.homeManagerConfiguration {
        pkgs = self.packages.x86_64-linux;
        extraSpecialArgs = {inherit inputs; };
        modules = [
          ./home
          ./home/users/jh-devv
          ./modules/home
        ];
      };
    };
  };
}
