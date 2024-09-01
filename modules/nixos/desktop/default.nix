{ lib, ... }:
with lib;
{
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
  };
  imports = [ ./cosmic ];
}
