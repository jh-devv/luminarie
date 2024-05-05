{lib, ...}:
with lib; {
  options.modules.home.services =
    genAttrs ["mpris-proxy"] (k: {enable = mkEnableOption k;})
    // {
      flatpak = {
        enable = mkEnableOption ''
          installing Flatpak applications with Nix from Home Manager
        '';
        packages = mkOption {
          example = ["com.obsproject.Studio"];

          type = types.listOf types.str;
          default = [""];
          description = ''
            You can choose few packages to install with Flatpak here.
              possible values: see Example.
          '';
        };
        groups = mkOption {
          example = ["media"];

          type = types.listOf types.str;
          default = [""];
          description = ''
            You can choose few package groups to install with Flatpak here.
            Though, these are just mine and how I see them!
              possible values: see Example.
          '';
        };
        overrides = mkOption {
          example = ''
            {
              com.visualstudio.code".Context.sockets = ["wayland" "!x11" "!fallback-x11"];
              global.Environment.LC_ALL = "C.UTF-8";
            };
          '';
          description = ''
            Applies provided attributes into Flatpak overrides file.
          '';
          type = with types; attrsOf (attrsOf (attrsOf (either str (listOf str))));
          default = {};
        };
      };
    };
}
