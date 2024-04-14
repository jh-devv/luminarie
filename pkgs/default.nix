{
  systems = ["x86_64-linux"];

  perSystem = {config, ...}: {
    overlayAttrs = {
      inherit (config.packages);
    };
    packages = {};
  };
}
