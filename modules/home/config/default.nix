{
  lib,
  config,
  inputs,
  ...
}: let
  cfg = config.jh-devv.home;
in {
  options.jh-devv.home = {
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = "Configuration for settings the current wallpaper set on system boot";
      default = builtins.toString "${inputs.self}/assets/city.png";
    };

    displays = lib.mkOption {
      description = "Config for new displays";
      type = with lib.types;
        listOf (
          submodule {
            options = {
              name = lib.mkOption {
                type = str;
                description = "The name of the display, e.g. eDP-1";
              };

              wallpaper = lib.mkOption {
                type = path;
                default = cfg.wallpaper;
                description = "The local Flake path of the wallpaper for the given display.";
              };

              hyprland = lib.mkOption {
                type = str;
                description = ''
                  Hyprland config for the monitor, see
                  https://wiki.hyprland.org/Configuring/Monitors/

                  e.g. 3440x1440@165,0x0,1.25
                '';
                default = "preferred,auto,auto";
              };

              workspaces = lib.mkOption {
                type = listOf int;
                description = "List of workspace strings";
                default = [1 2 3 4 5 6 7 8 9 10];
              };
            };
          }
        );
      default = [];
    };
  };
}
