{inputs, ...}: {
  imports = [
    inputs.arkenfox.hmModules.arkenfox

    inputs.nix-flatpak.homeManagerModules.nix-flatpak

    ../../modules/home
    ./home.nix
  ];
}
