{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.gnome-text-editor;
  text-editor = "org.gnome.TextEditor.desktop";
in {
  config = mkIf cfg.enable {
    xdg.mimeApps = mkIf (config.modules.home.desktop.session != "") {
      enable = true;
      defaultApplications = {
        "text/plain" = [text-editor];
      };
    };
    home.packages = with pkgs; [gnome-text-editor];
  };
}
