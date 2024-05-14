{lib, ...}:
with lib; {
  options.modules.nixos.boot =
    genAttrs ["systemd" "secure-boot"] (k: {enable = mkEnableOption k // {default = true;};})
    // {
      kernel.configuration.enable = mkEnableOption "kernel configuration" // {default = true;};
      plymouth.enable = mkEnableOption "plymouth";
    };
}
