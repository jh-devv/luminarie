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
        ../modules/home
        ./users/jh-devv
      ];
    };
  });
}
