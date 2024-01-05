{pkgs, ...}: {
  home.packages = with pkgs; [
    blueman
    brightnessctl
    gh
    fzf
    git
    killall
    jq
    mpv
    imv
    playerctl
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

  home.shellAliases = {
    ls = "lsd";
    grep = "rga";
  };
}
