{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./theme.rasi;
  };

  home.packages = [pkgs.rofi-power-menu];
}
