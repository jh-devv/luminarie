{
  lib,
  config,
  ...
}: {
  options.jh-devv.home.terminal = {
    zsh = {
      enable = lib.mkEnableOption "ZSH and plugins";
    };
    tools = {
      enable = lib.mkEnableOption "Replacements for basic tools (e.g. ls)";
    };
    tmux = {
      enable = lib.mkEnableOption "TMux";
    };
    neovim = {
      enable = lib.mkEnableOption "NeoVim";
    };
  };
}
