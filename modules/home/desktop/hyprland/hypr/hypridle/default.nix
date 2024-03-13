{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
  lock = "hyprlock";
in {
  config = mkIf (("hyprland" == cfg.session) && (cfg.power.lockscreen.enable || cfg.power.hibernation.enable)) {
    home.packages = with pkgs; [
      inputs.hyprland-hypridle.packages.${pkgs.system}.hypridle
    ];

    services.hypridle = {
      enable = true;
      lockCmd = lock;
      listeners = [
        {
          timeout = 500;
          onTimeout = lock;
          onResume = "";
        }
        {
          timeout = 1000;
          onTimeout = "systemctl suspend";
          onResume = "";
        }
      ];
      unlockCmd = "";
      afterSleepCmd = "";
      beforeSleepCmd = lock;
    };
  };
}
