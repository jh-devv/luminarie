{ lib, config, ... }:
{
  options.jh-devv.home.terminal = {
    zsh = {
      enable = lib.mkEnableOption "zsh and plugins";
    };
    rust-cli = {
      enable = lib.mkEnableOption "rust-cli-tools";
    };
    tmux = {
      enable = lib.mkEnableOption "tmux";
    };
    neovim = {
      enable = lib.mkEnableOption "neovim";
    };
  };
}