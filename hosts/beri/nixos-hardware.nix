{
  lib,
  modulesPath,
  inputs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/installer/sd-card/sd-image-aarch64.nix")
    (inputs.nixos-hardware + "/raspberry-pi/4")
  ];

  sdImage.compressImage = false;

  hardware = {
    raspberry-pi."4" = {
      apply-overlays-dtmerge.enable = true;
      fkms-3d.enable = true;
    };
  };

  # Fix missing modules
  # https://github.com/NixOS/nixpkgs/issues/154163
  nixpkgs = {
    overlays = [
      (_: super: {
        makeModulesClosure = x:
          super.makeModulesClosure (x // {allowMissing = true;});
      })
    ];

    hostPlatform = lib.mkDefault "aarch64-linux";
  };
}
