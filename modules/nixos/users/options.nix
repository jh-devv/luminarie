{lib, ...}:
with lib; {
  options.modules.nixos.users = mkOption {
    example = ''
      { ... }
    '';

    type = types.attrs;
    description = ''
      The user configuration of the system,
        possible values: see https://search.nixos.org/options?show=users.users
    '';
  };
}
