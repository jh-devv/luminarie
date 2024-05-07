{lib, ...}:
with lib; {
  options.modules.nixos.networking = mkOption {
    example = ''
      { ... }
    '';

    type = types.attrs;
    description = ''
      The networking configuration of the system,
        possible values: see https://search.nixos.org/options?show=networking
    '';
  };
}
