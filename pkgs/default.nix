{
  perSystem = {config, ...}: {
    overlayAttrs = {
      inherit (config.packages);
    };
    packages = {};
  };
}
