{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    overlayAttrs = {
      inherit (inputs.nixpkgs-stable.legacyPackages.${system}) plymouth;

      proton-ge-bin = pkgs.proton-ge-bin.overrideAttrs (_: {
        version = "GE-Proton9-5";
      });
    };
  };
}
