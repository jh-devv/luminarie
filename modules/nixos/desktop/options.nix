{
  lib,
  config,
  inputs,
  ...
}:
with lib; {
  options.modules.nixos.desktop = {
    session = mkOption {
      example = ["hyprland"];

      type = types.enum ["hyprland" null];
      default = "hyprland";
      description = ''
        The session you want to use (DE or WM with everything around)
        Make sure to also enable it from Home Manager for the full experience!
      '';
    };
  };
}
