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
  config = mkIf ("hyprland" == cfg.session) {
    home.packages = with pkgs; [
      inputs.hyprland-hyprlock.packages.${pkgs.system}.hyprlock
    ];

    xdg.configFile."hypr/hyprlock.conf".text = ''
      background {
        monitor =
        path = ${cfg.wallpaper}

        blur_size = 5
        blur_passes = 1
      }
      input-field {
        monitor =
        size = 200, 50
        outline_thickness = 3
        dots_size = 0.33
        dots_spacing = 0.15
        dots_center = false
        dots_rounding = -1
        placeholder_text = <span foreground="##C6D0F5" style="italic">Input Password...</span>
        fade_on_empty = false
        outer_color = rgb(B4BEFE)
        inner_color = rgb(1E1E2E)
        font_color = rgb(C6D0F5)
        fail_color = rgb(F38BA8)
        check_color = rgb(FAB387)
        fail_text = <span foreground="##C6D0F5" style="italic">$FAIL <b>($ATTEMPTS)</b></span>
        position = 0, -20
        halign = center
        valign = center
      }
      label {
        monitor =
        text = Welcome, $USER
        font_size = 25
        font_family = JetBrainsMono Nerd Font
        color = rgb(C6D0F5)

        position = 0, 80
        halign = center
        valign = center
      }
    '';
  };
}
