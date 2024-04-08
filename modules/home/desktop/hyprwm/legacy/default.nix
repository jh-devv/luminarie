{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf (cfg.session == "hyprland") {
    home.file."${config.xdg.configHome}" = {
      # current folder but without the nix file
      source = lib.cleanSourceWith {
        filter = name: _type: let
          baseName = baseNameOf (toString name);
        in
          ! (lib.hasSuffix ".nix" baseName);
        src = lib.cleanSource ./.;
      };
      recursive = true;
    };
  };
}
