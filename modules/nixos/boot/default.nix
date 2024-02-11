{
  boot.loader = {
    systemd-boot.enable = false;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      devices = ["nodev"];
      enable = true;
      efiSupport = true;
      # Resolutions above "1920x1080" are not supported by the UEFI driver
      gfxmodeEfi = "1920x1080";
      fontSize = 36;
    };
  };

  boot.plymouth = {
    enable = true;
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
}
