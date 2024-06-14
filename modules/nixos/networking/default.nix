{config, ...}: {
  config = {
    inherit (config.modules.nixos) networking;
  };
}
