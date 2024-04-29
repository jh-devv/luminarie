{
  lib,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./zsh.nix
  ];

  options.modules.home.shell = {
    package = mkOption {
      type = types.package;
      default = pkgs.zsh;
      description = ''
        Select the shell you want to use.
      '';
      example = pkgs.zsh;
    };
  };
}
