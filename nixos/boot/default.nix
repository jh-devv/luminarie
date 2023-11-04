{ options, config, lib, pkgs, ... }:
let
  cfg = config.jh-devv.nixos.boot;
in {
  config = lib.mkIf cfg.grub.enable {
    boot.loader = {
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        devices = [ "nodev" ];
        enable = true;
        efiSupport = true;
        gfxmodeEfi = "1920x1080";
        fontSize = 36;
      };
    };
    boot.plymouth = {
      enable = true;
    };

    swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 16*1024;
    } ];

    boot.kernel.sysctl = {
      "vm.max_map_count" = 16777216;
      "fs.file-max" = 524288;
    };

    #services.greetd = lib.mkIf cfg.greetd.enable {
    #  enable = true;
    #  settings = {
    #    default_session = {
    #      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd ${cfg.greetd.windowManager}";
    #      user = "greeter";
    #    };
    #  };
    #};
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      displayManager.sessionPackages = [ pkgs.hyprland ];
      libinput.enable = true;
    };
  };
}
