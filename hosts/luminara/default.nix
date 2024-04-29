{pkgs, ...}: {
  imports = [
    ./hardware.nix
  ];

  modules.nixos.desktop = {
    session = "hyprland";

    steam.enable = true;
  };

  networking = {
    hostName = "luminara";
    networkmanager.enable = true;
  };

  users.users.jh-devv = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  time.timeZone = "Europe/Helsinki";

  services.xserver.xkb.layout = "fi";
  console.keyMap = "fi";

  system.stateVersion = "23.05";
}
