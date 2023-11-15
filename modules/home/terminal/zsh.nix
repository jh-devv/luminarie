{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.zsh;
in {
  config = lib.mkIf cfg.enable { 
    programs.zsh = {
        enable = true;
        initExtra = "nitch";
        syntaxHighlighting.enable = true;
        enableAutosuggestions = true;
        oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        };
    };

    programs.starship.enable = true;
    programs.starship.enableZshIntegration = true;

    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        font.name = "FiraCode Nerd Font Mono";
        theme = "Catppuccin-Mocha";
    };

    home.shellAliases = {
        rm = "trash-put";
    };
  };
}
