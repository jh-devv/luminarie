{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.home.programs.stardrop;
  launcher = "stardrop.desktop";
in
{
  options.modules.home = {
    programs = {
      stardrop = {
        enable = mkEnableOption "stardrop";
        extraThemes = mkOption {
          type = types.listOf (types.enum [ "Catppuccin-Mocha" ]);
          default = [ "Catppuccin-Mocha" ];
          description = "The themes you want to available on top of the standard included ones.";
        };
      };
    };
  };
  config = mkIf cfg.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/nxm" = [ launcher ];
      };
    };
    home.packages = [
      (pkgs.stardrop.override {
        extraThemes = map (t: ./themes + "/${t}.xaml") cfg.extraThemes;
      })
    ];
  };
}
