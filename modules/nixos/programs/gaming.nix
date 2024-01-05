{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    mangohud
    steamtinkerlaunch
  ];

  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };
}
