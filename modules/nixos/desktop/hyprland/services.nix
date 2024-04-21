{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.services;
in {
  config = mkIf cfg.enable {
    services = {
      printing.enable = true;
      openssh.enable = true;
      blueman.enable = true;
      gvfs.enable = true;
      udev.packages = [pkgs.yubikey-personalization];
      flatpak.enable = true;
      pcscd.enable = true;
      fwupd.enable = true;

      dbus.packages = [pkgs.gcr];

      gnome.gnome-keyring.enable = true;
    };
    programs = {
      dconf.enable = true;
      seahorse.enable = true;
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    environment.systemPackages = with pkgs; [
      gedit
      glib
      gnome.nautilus
      gnome.file-roller
    ];

    security.pam.services.gdm.enableGnomeKeyring = true;

    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      libinput.enable = true;
      excludePackages = [pkgs.xterm];
    };
  };
}
