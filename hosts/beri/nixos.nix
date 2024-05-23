{pkgs, ...}: {
  modules.nixos = {
    language = {
      layout = "fi";
      time = "Europe/Helsinki";
    };

    users = {
      pi = {
        isNormalUser = true;
        initialPassword = "raspberry";
        extraGroups = ["wheel"];
      };
    };

    networking = {
      hostName = "beri";
    };

    desktop = {
      session = "gnome";
    };
  };

  environment.systemPackages = with pkgs; [teamviewer];

  system.stateVersion = "23.05";
}
