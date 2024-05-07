{lib, ...}:
with lib; {
  options.modules.nixos.programs = genAttrs ["gamemode" "wayland"] (k: {enable = mkEnableOption k;});
}
