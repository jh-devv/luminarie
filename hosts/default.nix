{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
in {
  flake.nixosConfigurations = {
    aisu = withSystem "x86_64-linux" (_:
      nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./aisu];
      });
    beri = withSystem "aarch64-linux" (_:
      nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./beri];
      });
  };
}
