{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    mangohud
  ];

  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };
}
