{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  flake.homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
    "jh-devv@luminara" = homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./users/jh-devv
        ../modules/home
      ];
    };
  });
}
