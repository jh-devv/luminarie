{
  lib,
  pkgs,
  ...
}:
with lib; {
  options.modules.home.shell = {
    subtitutes.enable = mkOption {
      type = types.bool;
      description = ''
        My list of subtitutes for common shell tools, like lsd for ls.
      '';
    };
    package = mkOption {
      type = types.package;
      description = ''
        Select the shell you want to use.
      '';
      example = pkgs.zsh;
    };
  };
}
