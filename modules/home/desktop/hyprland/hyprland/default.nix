{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    home.packages = with pkgs; [
      blueman
      pavucontrol
      wl-clipboard
      grimblast
    ];

    wayland.windowManager.hyprland = {
      enable = true;

      systemd.enable = true;

      settings = {
        monitor = map (m: "${m.name},${m.hyprland}") cfg.displays;
        workspace = concatMap (m: map (w: "${toString w},monitor:${m.name}") m.workspaces) cfg.displays;

        "$mod" = "SUPER";
        "$rosewater" = "0xfff5e0dc";
        "$peach" = "0xfffab387";
        "$sapphire" = "0xff74c7ec";
        "$lavender" = "0xffb4befe";
        "$mantle" = "0xff181825";

        exec-once = [
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 15;
          border_size = 2;
          layout = "dwindle";
          "col.active_border" = "$rosewater $sapphire $peach $lavender 90deg";
          "col.inactive_border" = "$mantle";
        };

        decoration = {
          rounding = 10;
          drop_shadow = false;
          shadow_range = 4;
          shadow_render_power = 3;
          blur = {
            enabled = true;
            new_optimizations = "on";
            size = 5;
            passes = 1;
          };
          "col.shadow" = "rgba(1a1a1aee)";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_is_master = true;
        };

        windowrulev2 = [
          "fullscreen,class:^(Minecraft)(.*)$"
          "fullscreen,class:^(steam_app_1250410)$"
          "opacity 0.90 0.90,class:^(firefox)$"
          "opacity 0.80 0.80,class:^(Steam)$"
          "opacity 0.80 0.80,class:^(steam)$"
          "opacity 0.80 0.80,class:^(steamwebhelper)$"
          "opacity 0.80 0.80,class:^(Code)$"
          "opacity 0.80 0.80,class:^(code-url-handler)$"
          "opacity 0.80 0.80,class:^(kitty)$"
          "opacity 0.80 0.80,class:^(org.gnome.Nautilus)$"
          "opacity 0.80 0.80,class:^(file-roller)$"
          "opacity 0.80 0.80,class:^(qt5ct)$"
          "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$"
          "opacity 0.80 0.80,class:^(org.gnome.Fractal)$"
          "opacity 0.80 0.70,class:^(pavucontrol)$"
          "opacity 0.80 0.70,class:^(.*)(blueman-manager)(.*)$"
          "opacity 0.80 0.70,class:^(nm-applet)$"
          "opacity 0.80 0.70,class:^(nm-connection-editor)$"
          "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
          "float,class:^(qt5ct)$"
          "float,class:^(file-roller)$"
          "float,class:^(pavucontrol)$"
          "float,class:^(blueman-manager)$"
          "float,class:^(nm-applet)$"
          "float,class:^(nm-connection-editor)$"
          "float,class:^(polkit-gnome-authentication-agent-1)$"
          "float,class:^(kitty)$"
          "float,class:^(mpv)$"
          "stayfocused, title:^()$,class:^(steam)$"
          "minsize 1 1, title:^()$,class:^(steam)$"
        ];

        bind =
          [
            # Move focus with mod + arrow keys
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"

            # Switch workspaces with mod + [0-9]
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            # Move active window to a workspace with mod + SHIFT + [0-9]
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"

            # Scroll through existing workspaces with mod + scroll
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"

            "$mod, S, exec, rofi -show drun -show-icons"
            "$mod, Q, exec, kitty"
            "$mod, C, killactive"
            "$mod, M, exit"
            "$mod, B, togglefloating"
            "$mod, F, fullscreen"

            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, L, movewindow, r"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, J, movewindow, d"

            "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

            ",Print, exec, grimblast --notify --cursor copysave screen"
            "$mod, Print, exec, grimblast --notify --cursor copysave area"
          ]
          ++ optionals cfg.power.lockscreen.enable ["$mod, L, exec, hyprlock"];

        bindm = [
          # Move/resize windows with mod + LMB/RMB and dragging
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        gestures = {
          workspace_swipe = "off";
        };

        misc = {
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "fi";
        };
      };
    };
  };
}
