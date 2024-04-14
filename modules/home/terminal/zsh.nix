{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.terminal;
in {
  config = mkIf (cfg.shell == "zsh") {
    home.packages = with pkgs; [
      gh
      git
      killall
      file
      tree
      ffmpeg
      jq
      fd
      lsd
      ripgrep-all
      nitch
      libwebp
      yt-dlp
      trash-cli
      unzip
      ranger
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
      grep = "rga";
    };
  };
}
