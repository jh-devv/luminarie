{pkgs, ...}: {
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
    mpv
    yt-dlp
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
      enableAutosuggestions = true;
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
      enableZshIntegration = true; # see note on other shells below
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
}
