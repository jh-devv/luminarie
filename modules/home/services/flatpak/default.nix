{ config, lib, ... }:
with lib;
let
  cfg = config.modules.home.services.flatpak;
in
{
  options.modules.home = {
    services = {
      flatpak = {
        enable = mkEnableOption ''
          Installing Flatpak applications with Nix from Home Manager.
        '';
        packages = mkOption {
          example = [ "com.obsproject.Studio" ];
          type = types.listOf types.str;
          default = [ "" ];
          description = ''
            List of Flatpak packages to install.
          '';
        };
        groups = mkOption {
          example = [ "media" ];
          type = types.listOf types.str;
          default = [ "" ];
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
          default = { };
        };
      };
    };
  };
  config = mkMerge [
    (mkIf (cfg.enable && builtins.elem "media" cfg.groups) {
      modules.home.services.flatpak.packages = [
        "com.obsproject.Studio"
        "org.inkscape.Inkscape"
        "org.gimp.GIMP"
      ];
    })
    (mkIf cfg.enable {
      modules.home.services.flatpak.overrides = {
        global = {
          # Force Wayland by default
          # Context.sockets = ["wayland" "!x11" "!fallback-x11"];
        };
      };
      services.flatpak = {
        enable = true;
        inherit (cfg) packages;
        inherit (cfg) overrides;
      };
    })
  ];
}
