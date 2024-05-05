{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf ((cfg.session == "hyprland") && cfg.power.lockscreen.enable) {
    home.packages = [
      inputs.hyprland-hyprlock.packages.${pkgs.system}.hyprlock
    ];

    programs.hyprlock = {
      enable = true;
      backgrounds =
        map (display: {
          monitor = display.name;
          path = display.wallpaper;

          blur_size = 5;
          blur_passes = 1;
          color = "rgb(#11111B)";
        })
        cfg.displays;

      input-fields =
        map (display: {
          monitor = display.name;
          size = {
            width = 200;
            height = 50;
          };
          placeholder_text = "<span foreground='##C6D0F5' style='italic'>Input Password...</span>";
          fade_on_empty = false;
          outer_color = "rgb(B4BEFE)";
          inner_color = "rgb(1E1E2E)";
          font_color = "rgb(C6D0F5)";
          fail_color = "rgb(F38BA8)";
          check_color = "rgb(FAB387)";

          fail_text = "<span foreground='##C6D0F5' style='italic'>$FAIL <b>($ATTEMPTS)</b></span>";
          position = {
            x = 0;
            y = -20;
          };
          halign = "center";
          valign = "center";
        })
        cfg.displays;

      labels =
        map (display: {
          monitor = display.name;
          text = "Welcome, $USER";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font";
          color = "rgb(C6D0F5)";

          position = {
            x = 0;
            y = 80;
          };

          halign = "center";
          valign = "center";
        })
        cfg.displays;
    };
  };
}
