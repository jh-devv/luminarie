{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gamemode
    gamescope
    mangohud
    pkgsi686Linux.gperftools
  ];

  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };
}
