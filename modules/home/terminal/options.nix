{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.modules.home = {
    shell = mkOption {
      type = types.enum ["zsh"];
      default = "zsh";
      description = ''
        Select the shell you want to use.
      '';
      example = "zsh";
    };
    tmux.enable = mkEnableOption "Enable Tmux";
    neovim.enable = mkEnableOption "Enable NeoVim";
  };
}
