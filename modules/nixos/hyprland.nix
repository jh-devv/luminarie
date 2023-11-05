{ options, config, lib, ... }:
{
  options.jh-devv.nixos.hyprland = {
    enable = lib.mkEnableOption "hyprland and core pkgs e.g. audio and XDG";
  };
}
