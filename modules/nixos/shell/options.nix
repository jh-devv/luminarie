{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.modules.nixos = {
    shell = mkOption {
      example = ["zsh"];

      type = types.enum ["zsh" null];
      default = "zsh";
      description = ''
        The shell you want to use.
          possible values: see Example.
      '';
    };
  };
}
