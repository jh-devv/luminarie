{inputs, ...}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote

    ../../modules/nixos
    ./nixos.nix
    ./nixos-hardware.nix
  ];
}
