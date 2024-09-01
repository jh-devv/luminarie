{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.home.programs.nautilus;
  file-explorer = "org.gnome.Nautilus.desktop";
  zip-manager = "org.gnome.FileRoller.desktop";
in
{
  options.modules.home = {
    programs =
      genAttrs
        [
          "nautilus"
        ]
        (k: {
          enable = mkEnableOption k;
        });
  };
  config = mkIf cfg.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/zip" = [ zip-manager ];
        "inode/directory" = [ file-explorer ];
      };
    };
    home.packages = with pkgs; [
      nautilus
      file-roller
    ];
  };
}
