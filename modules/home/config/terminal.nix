{ lib, config, ... }:
{
  options.jh-devv.home.terminal = {
    zsh = {
      enable = lib.mkEnableOption "zsh and plugins";
    };
    tmux = {
      enable = lib.mkEnableOption "tmux";
    };
  };
}