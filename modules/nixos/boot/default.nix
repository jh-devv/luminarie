{ options, config, lib, pkgs, inputs, ... }:
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

    #services.greetd = lib.mkIf cfg.greetd.enable {
    #  enable = true;
    #  settings = {
    #    default_session = {
    #      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd ${cfg.greetd.windowManager}";
    #      user = "greeter";
    #    };
    #  };
    #};

    services.xserver = lib.mkIf cfg.gdm.enable {
      enable = true;
      displayManager.gdm = { 
        enable = true;
	      wayland = true;
      };
      displayManager.sessionPackages = [ cfg.gdm.windowManager ];
      libinput.enable = true;
      excludePackages = [pkgs.xterm];
    };
  };
}
