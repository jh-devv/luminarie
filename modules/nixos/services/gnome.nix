{pkgs, ...}: {
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
}
