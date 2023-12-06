{ config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.home.terminal.tools;
in {
  config = lib.mkIf cfg.enable { 
    home.packages = with pkgs; [
      blueman
      brightnessctl
      cmake
      gnumake
      fzf
      gcc
      git
      killall
      jq
      meson
      mpv
      imv
      playerctl
      libwebp
      ripgrep-all
      ranger
      file
      ffmpeg
      lsd
      fd
      tree
      unzip
      vim
      wget
      ];
    home.shellAliases = {
        ls = "lsd";
        grep = "rga";
    };
    };
}
