{pkgs, ...}: {
  home.packages = [pkgs.playerctl];
  services.mpris-proxy.enable = true;
}
