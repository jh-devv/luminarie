{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.neovim;
in {
  config = lib.mkIf cfg.enable { 
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        plugins = [
          {
            plugin = pkgs.vimPlugins.catppuccin-nvim;
          }
        ];
      };
    };
}
