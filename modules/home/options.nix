{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  options.modules.home = {
    desktop = {
      /*
         power = {
        lockscreen = {
          enable = mkEnableOption "automatic system lockscreen";
          timeout = mkOption {
            default = 5;
            example = 5;
            type = types.int;
            description = "Timeout for automatic system lockscreen (in minutes)";
          };
          wallpaper = mkOption {
            type = types.path;
            default = cfg.wallpaper;
            description = "The local flake path of the wallpaper for the lockscreen.";
          };
        };
        suspend = {
          enable = mkEnableOption "automatic system suspend";
          timeout = mkOption {
            default = 30;
            example = 30;
            type = types.int;
            description = "Timeout for automatic system suspend (in minutes)";
          };
        };
      };
      */

      session = {
        cosmic = {
          enable = mkEnableOption "cosmic";

          # assertions =
          #   [ { assertion = !config.modules.home.desktop.session.sway.enable;
          #     message = "cosmic conflicts with sway";
          #   };
          # ];
        };
      };

      wallpaper = mkOption {
        type = types.path;
        description = "The local flake path of the wallpaper as default.";
        default = builtins.toString "${inputs.self}/assets/city.png";
      };

      displays = mkOption {
        description = "Config for new displays";
        type = with types;
          listOf (
            submodule {
              options = {
                name = mkOption {
                  type = str;
                  description = "The name of the display, e.g. eDP-1";
                };

                wallpaper = mkOption {
                  type = path;
                  default = cfg.wallpaper;
                  description = "The local flake path of the wallpaper for the given display.";
                };

                workspaces = mkOption {
                  type = listOf int;
                  description = "List of workspace numbers";
                  default = [1 2 3 4 5 6 7 8 9 10];
                };
              };
            }
          );
        default = [];
      };
    };
    services =
      genAttrs ["mpris-proxy"] (k: {enable = mkEnableOption k;})
      // {
        flatpak = {
          enable = mkEnableOption ''
            Installing Flatpak applications with Nix from Home Manager.
          '';
          packages = mkOption {
            example = ["com.obsproject.Studio"];
            type = types.listOf types.str;
            default = [""];
            description = ''
              List of Flatpak packages to install.
            '';
          };
          groups = mkOption {
            example = ["media"];
            type = types.listOf types.str;
            default = [""];
            description = ''
              List of Flatpak package groups to install.
            '';
          };
          overrides = mkOption {
            example = ''
              {
                "com.visualstudio.code".Context.sockets = ["wayland" "!x11" "!fallback-x11"];
                global.Environment.LC_ALL = "C.UTF-8";
              };
            '';
            description = ''
              Attributes to apply in Flatpak overrides file.
            '';
            type = with types; attrsOf (attrsOf (attrsOf (either str (listOf str))));
            default = {};
          };
        };
      };

    shell = {
      common.enable = mkEnableOption "common shell tools";
      fetcher.package = mkOption {
        type = types.package;
        description = ''
          The fetcher package to use.
        '';
        example = pkgs.hyfetch;
        default = pkgs.nitch;
      };
      package = mkOption {
        type = types.package;
        description = ''
          The shell package to use.
        '';
        example = pkgs.bash;
        default = pkgs.zsh;
      };
    };

    programs =
      genAttrs ["fractal" "kitty" "mpv" "nautilus" "vscode"] (k: {enable = mkEnableOption k;})
      // {
        firefox = {
          enable = mkEnableOption "firefox";
          theme.package = mkOption {
            example = pkgs.firefox-gnome-theme;
            type = types.nullOr types.package;
            default = pkgs.firefox-gnome-theme;
            description = ''
              The user theme to apply to Firefox.
            '';
          };
        };
      };
  };
}
