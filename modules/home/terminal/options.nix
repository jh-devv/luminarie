{lib, ...}:
with lib; {
  options.modules.home.terminal = {
    # The packages snippet below generates mkEnableOptions for the listed packages.
    # Though, you can still add more complex options for some packages using //.
    packages = lib.genAttrs ["neovim" "mpv"] (k: {enable = mkEnableOption k;}) // {};
    shell = mkOption {
      type = types.enum ["zsh"];
      default = "zsh";
      description = ''
        Select the shell you want to use.
      '';
      example = "zsh";
    };
  };
}
