{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.boot.kernel.configuration;
in {
  config = mkIf cfg.enable {
    boot = {
      kernel.sysctl = {
        "vm.max_map_count" = 16777216;
        "fs.file-max" = 524288;
      };
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
