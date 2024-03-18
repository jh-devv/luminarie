{lib, ...}:
with lib; {
  options.modules.home.terminal = {
    shell = mkOption {
      type = types.enum ["zsh"];
      default = "zsh";
      description = ''
        Select the shell you want to use.
      '';
      example = "zsh";
    };
    nvim.enable = mkEnableOption "Enable nvim" // {default = true;};
  };
}
