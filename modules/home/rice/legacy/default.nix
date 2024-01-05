{
  config,
  lib,
  ...
}: {
  home.file."${config.xdg.configHome}" = {
    # current folder but without the nix file
    source = lib.cleanSourceWith {
      filter = name: type: let
        baseName = baseNameOf (toString name);
      in
        ! (lib.hasSuffix ".nix" baseName);
      src = lib.cleanSource ./.;
    };
    recursive = true;
  };
}
