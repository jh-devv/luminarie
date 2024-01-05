{
  options,
  config,
  lib,
  ...
}: {
  options.jh-devv.nixos.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };
}
