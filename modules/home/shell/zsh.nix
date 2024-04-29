{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.shell;
in {
  config = mkIf (cfg.package == pkgs.zsh) {
    home.packages = with pkgs; [
      coreutils
      gnugrep
      gh
      git
      lsd
      ripgrep-all
      nitch
      trash-cli
    ];

    programs = {
      zsh = {
        enable = true;
        initExtra = ''
          nitch
        '';

        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git"];
        };
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };

      kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        font.name = "JetBrainsMono Nerd Font";
        theme = "Catppuccin-Mocha";
      };
    };

    home.shellAliases = {
      rm = "trash-put";
      ls = "lsd";
    };
  };
}
