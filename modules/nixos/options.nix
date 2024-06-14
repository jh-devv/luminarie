{
  lib,
  pkgs,
  ...
}:
with lib; {
  options.modules.nixos = {
    desktop = {
      session = {
        cosmic = {
          enable = mkEnableOption "cosmic";

          # assertions =
          #   [ { assertion = !config.modules.nixos.desktop.session.sway.enable;
          #     message = "cosmic conflicts with sway";
          #   };
          # ];
        };
      };
    };

    networking = mkOption {
      example = ''
        {
          interfaces.eth0.useDHCP = true;
          hostName = "my-nixos-host";
          domainName = "local";
        }
      '';
      type = types.attrs;
      description = ''
        The networking configuration of the system,
        possible values: see https://search.nixos.org/options?show=networking
      '';
    };

    users = mkOption {
      example = ''
        {
          users.users.alice = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" ];
            hashedPassword = "$6$saltsalt$...";
          };
        }
      '';
      type = types.attrs;
      description = ''
        The user configuration of the system,
        possible values: see https://search.nixos.org/options?show=users.users
      '';
    };

    boot = {
      plymouth.enable = mkEnableOption "plymouth";
      systemd.enable = mkEnableOption "systemd";
      lanzaboote.enable = mkEnableOption "secure boot";
    };

    shell = {
      package = mkOption {
        type = types.package;
        default = pkgs.zsh;
        description = ''
          Select the shell you want to use.
        '';
        example = pkgs.zsh;
      };
    };

    language = {
      locale = mkOption {
        type = types.str;
        default = "en_US.UTF-8";
        example = "fi_FI.UTF-8";
      };
      layout = mkOption {
        type = types.str;
        default = "us";
        example = "fi";
      };
      time = mkOption {
        type = types.str;
        default = "America/New_York";
        example = "Europe/Helsinki";
      };
    };

    programs =
      genAttrs ["steam"] (k: {enable = mkEnableOption k;});
  };
}
