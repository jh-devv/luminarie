{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    overlayAttrs = {
      inherit (config.packages) firefox-gnome-theme;
    };
    packages = {
      firefox-gnome-theme = pkgs.callPackage ./firefox-gnome-theme {};
    };
  };
}
