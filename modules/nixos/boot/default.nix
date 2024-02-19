{
  pkgs,
  lib,
  ...
}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    systemd-boot = {
      enable = lib.mkForce false;
      consoleMode = "max";
    };

    timeout = 1;
  };

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  boot.plymouth = {
    enable = true;
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };

  environment.systemPackages = with pkgs; [
    sbctl
    efibootmgr
    e2fsprogs.bin
  ];
}
