{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.flatpak;
in {
  config = mkMerge [
    (mkIf
      (cfg.enable && builtins.elem "media" cfg.groups)
      {
        modules.home.desktop.flatpak.packages = ["com.obsproject.Studio"];
      })
    (mkIf
      (cfg.enable)
      {
        services.flatpak = {
          enable = true;
          packages = cfg.packages;
        };
      })
  ];
}
