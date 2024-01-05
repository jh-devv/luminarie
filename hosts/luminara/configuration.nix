{
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
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
