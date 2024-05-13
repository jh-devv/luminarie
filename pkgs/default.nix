{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    config,
    pkgs,
    system,
    ...
  }: {
    overlayAttrs = {
      inherit (config.packages) firefox-gnome-theme dark-reader proton-ge-bin plymouth;
    };
    packages = {
      firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme {};
      dark-reader = pkgs.callPackage ./dark-reader {};
      proton-ge-bin = pkgs.callPackage ./proton-ge-bin {};

      inherit (inputs.nixpkgs-stable.legacyPackages.${system}) plymouth;
    };
  };
}
