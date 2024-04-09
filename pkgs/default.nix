{
  systems = ["x86_64-linux"];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    overlayAttrs = {
      inherit (config.packages) arm-image-installer;
    };
    packages = {
      arm-image-installer = pkgs.callPackage ./arm-image-installer.nix {};
    };
  };
}
