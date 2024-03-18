{lib, ...}:
with lib; {
  options.modules.nixos = {
    programs = mkOption {
      example = ["steam"];

      type = types.listOf types.str;
      default = ["steam"];
      description = ''
        List of program "groups" to install.
          possible values: see Example.
      '';
    };
  };
}
