{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    git
    killall
    jq
    nitch
    mpv
    yt-dlp
    libwebp
    ripgrep-all
    ranger
    file
    ffmpeg
    lsd
    fd
    tree
    unzip
  ];

  programs.zsh = {
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

  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font.name = "JetBrainsMono Nerd Font";
    theme = "Catppuccin-Mocha";
  };

  home.shellAliases = {
    rm = "trash-put";
    ls = "lsd";
    grep = "rga";
  };
}
