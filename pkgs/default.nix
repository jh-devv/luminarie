{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];
  perSystem =
    { config, pkgs, ... }:
    {
      overlayAttrs = {
        inherit (config.packages) firefox-gnome-theme dark-reader stardrop;
      };
      packages = {
        firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme/package.nix { };
        dark-reader = pkgs.callPackage ./dark-reader/package.nix { };
        stardrop = pkgs.callPackage ./stardrop/package.nix { };
      };
    };
}
