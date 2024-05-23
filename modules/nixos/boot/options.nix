{lib, ...}:
with lib; {
  options.modules.nixos.boot = {
    plymouth.enable = mkEnableOption "plymouth";
    systemd.enable = mkEnableOption "systemd";
    lanzaboote.enable = mkEnableOption "secure boot";
  };
}
