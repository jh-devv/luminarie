{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking Configuration
  networking = {
    hostName = "luminara";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Helsinki";

  services.xserver.layout = "fi";

  # System Version
  system.stateVersion = "23.05";
}
