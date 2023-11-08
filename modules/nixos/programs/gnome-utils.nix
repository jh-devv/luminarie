{ options, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.nixos.pkgs.gnome-utils;
in {
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      glibc
      glib
      gnome.gnome-keyring
      gnome.nautilus
      gnome.gedit
      gnome.file-roller
      gtk3
      polkit_gnome
      libgnome-keyring
      dconf
      gnome.seahorse
      ];

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.sddm.enableGnomeKeyring = true;

  };
}
