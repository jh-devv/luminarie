{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.services.flatpak;
in {
  config = mkMerge [
    (mkIf
      (cfg.enable && builtins.elem "media" cfg.groups)
      {
        modules.home.services.flatpak.packages = ["com.obsproject.Studio" "org.inkscape.Inkscape" "org.gimp.GIMP"];
      })
    (mkIf
      cfg.enable
      {
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
