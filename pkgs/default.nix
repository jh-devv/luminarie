{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    overlayAttrs = {
      inherit (config.packages) firefox-gnome-theme dark-reader proton-ge-bin;
    };
    packages = {
      firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme {};
      dark-reader = pkgs.callPackage ./dark-reader {};
      proton-ge-bin = pkgs.callPackage ./proton-ge-bin {};
    };
  };
}
