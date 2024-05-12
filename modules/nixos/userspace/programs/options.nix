{lib, ...}:
with lib; {
  options.modules.nixos.programs = genAttrs ["steam" "wayland"] (k: {enable = mkEnableOption k;});
}
