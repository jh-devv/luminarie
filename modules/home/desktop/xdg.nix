{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
  browser = "firefox.desktop";
  video-player = "mpv.desktop";
  audio-player = "mpv.desktop";
  image-viewer = "mpv.desktop";
  pdf-viewer = "firefox.desktop";
  text-editor = "org.gnome.gedit.desktop";
  file-explorer = "org.gnome.Nautilus.desktop";
  zip-manager = "org.gnome.FileRoller.desktop";

  associations = {
    "application/x-extension-htm" = [browser];
    "application/x-extension-html" = [browser];
    "application/x-extension-shtml" = [browser];
    "application/x-extension-xht" = [browser];
    "application/x-extension-xhtml" = [browser];
    "application/xhtml+xml" = [browser];
    "application/json" = [browser];
    "application/zip" = [zip-manager];
    "text/html" = [browser];
    "x-scheme-handler/about" = [browser];
    "x-scheme-handler/ftp" = [browser];
    "x-scheme-handler/http" = [browser];
    "x-scheme-handler/https" = [browser];
    "x-scheme-handler/unknown" = [browser];
    "video/*" = [video-player];
    "audio/*" = [audio-player];
    "image/*" = [image-viewer];
    "application/pdf" = [pdf-viewer];
    "text/plain" = [text-editor];
    "inode/directory" = [file-explorer];
  };
in {
  config = mkIf (cfg.session != "") {
    xdg = {
      enable = true;

      mimeApps = {
        enable = true;
        defaultApplications = associations;
      };
    };
  };
}
