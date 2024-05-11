{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
  lock = "hyprlock";
in {
  config = mkIf ((cfg.session == "hyprland") && (cfg.power.lockscreen.enable || cfg.power.hibernation.enable)) {
    services.hypridle = {
      enable = true;
      settings = {
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
  };
}
