{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services.wayland;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cliphist
      kitty
      libnotify
      libsecret
      libvirt
      pamixer
      wl-clipboard
      wlr-randr
      xdg-utils
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
