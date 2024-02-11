{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.services;
in {
  imports = [
    ./options.nix
  ];

  config = mkMerge [
    (mkIf
      (builtins.elem "base" cfg)
      {
        services = {
          printing.enable = true;
          openssh.enable = true;
          blueman.enable = true;
          gvfs.enable = true;
          udev.packages = [pkgs.yubikey-personalization];
          flatpak.enable = true;
          pcscd.enable = true;
        };
        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        virtualisation.docker.enable = true;
      })
    (mkIf
      (builtins.elem "gnome" cfg)
      {
        environment.systemPackages = with pkgs; [
          gedit
          glib
          gnome.nautilus
          gnome.file-roller
        ];

        programs = {
          dconf.enable = true;
          seahorse.enable = true;
        };

        services = {
          # needed for GNOME services outside of GNOME Desktop
          dbus.packages = [pkgs.gcr];

          gnome.gnome-keyring.enable = true;
        };

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
      })
  ];
}
