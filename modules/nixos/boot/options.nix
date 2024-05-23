{
  lib,
  pkgs,
  ...
}:
with lib; {
  options.modules.nixos.boot = {
    plymouth.enable = mkEnableOption "plymouth";
    systemd.enable = mkEnableOption "systemd";
    lanzaboote.enable = mkEnableOption "secure boot";
    kernel = {
      package = mkOption {
        type = types.attrs;
        default = pkgs.linuxPackages_latest;
      };
      patches.amdgpu.enable = mkEnableOption "patches for amdgpu";
      params.enable = mkEnableOption "params for the kernel";
    };
  };
}
