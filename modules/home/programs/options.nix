{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.modules.home = {
    programs = mkOption {
      example = ["gnome"];

      type = types.listOf types.str;
      default = ["gnome"];
      description = ''
        List of program "groups" to install for the user.
          possible values: see Example.
      '';
    };
  };
}
