{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nixos.boot.kernel;
in {
  config = {
    boot = {
      kernelPackages = cfg.package;
      kernelPatches = [
        (mkIf cfg.patches.amdgpu.enable {
          name = "amdgpu_res_cpu_visible";
          patch = ./patches/amdgpu_res_cpu_visible.patch;
        })
      ];
      kernel.sysctl = mkIf cfg.params.enable {
        "vm.max_map_count" = 16777216;
        "fs.file-max" = 524288;
      };
    };
  };
}
