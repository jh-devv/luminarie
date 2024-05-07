{config, ...}: {
  imports = [
    ./hardware.nix
  ];

  modules.nixos = {
    language = {
      layout = "fi";
      time = "Europe/Helsinki";
    };

    users = {
      jh-devv = {
        shell = config.modules.nixos.shell.package;
        isNormalUser = true;
        extraGroups = ["wheel"];
      };
    };

    networking = {
      hostName = "aisu";
      networkmanager.enable = true;
    };

    desktop = {
      session = "hyprland";
    };
  };

  networking = {
    hostName = "aisu";
    networkmanager.enable = true;
  };

  system.stateVersion = "23.05";
}
