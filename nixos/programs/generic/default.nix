{ options, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.nixos.pkgs.generic;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      blueman
      brightnessctl
      cargo
      cmake
      fzf
      gcc
      git
      killall
      jq
      meson
      mpv
      neofetch
      ranger
      rustup
      tree
      unzip
      vim
      wget
      ];
  };
}
