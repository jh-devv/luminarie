{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    programs.waybar = {
      enable = true;
      settings = [
        {
          margin = "8px 15px -2px 15px";
          exclusive = true;
          passthrough = false;

          "gtk-layer-shell" = true;

          layer = "top";
          position = "top";
          mod = "dock";

          "modules-left" = ["custom/nix" "hyprland/workspaces" "hyprland/window"];
          "modules-center" = ["custom/media"];
          "modules-right" = ["pulseaudio" "clock" "tray" "custom/powermenu"];

          "custom/nix" = {
            format = " ";
            tooltip = false;
            "on-click" = "rofi -show drun -show-icons";
          };
          "hyprland/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = true;
            format = "{name}";
          };
          clock = {
            "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = " {:%H:%M}";
          };
          "hyprland/window" = {
            "max-length" = 48;
            format = "{}";
          };
          "custom/media" = {
            format = "{icon} <span>{}</span>";
            "return-type" = "json";
            "max-length" = 48;
            exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
            "on-click" = "playerctl play-pause";
            "on-click-middle" = "playerctl previous";
            "on-click-right" = "playerctl next";
            "format-icons" = {
              Playing = "<span>󰒮 󰐌 󰒭</span>";
              Paused = "<span>󰒮 󰏥 󰒭</span>";
            };
          };
          pulseaudio = {
            format = "{icon} {volume}%";
            "format-bluetooth" = "{icon}⠀ {volume}%";
            "format-muted" = "󰝟";
            "format-icons" = {
              headphone = "";
              "hands-free" = "󰋋";
              headset = "󰋎";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            "on-click-middle" = "pamixer -t";
            "on-scroll-up" = "pamixer -i 5";
            "on-scroll-down" = "pamixer -d 5";
            "scroll-step" = 1;
            "on-click" = "pavucontrol";
            "ignored-sinks" = ["Easy Effects Sink"];
          };
          tray = {
            spacing = 10;
          };
          "custom/powermenu" = {
            "on-click" = "rofi -show power-menu -modi power-menu:'rofi-power-menu'";
            format = "";
          };
        }
      ];
      style = ''
        ${builtins.readFile ./css/theme.css}
        ${builtins.readFile ./css/style.css}
      '';
    };

    home.packages = [pkgs.playerctl];
  };
}
