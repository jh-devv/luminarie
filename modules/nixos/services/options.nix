{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.modules.nixos = {
    services = mkOption {
      example = ["base" "gnome"];

      type = types.listOf types.str;
      default = ["base" "gnome"];
      description = ''
        List of services to use.
          possible values: see Example.
      '';
    };
  };
}
