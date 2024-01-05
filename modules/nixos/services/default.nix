{pkgs, ...}: {
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
}
