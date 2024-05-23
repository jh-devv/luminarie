{lib, ...}:
with lib; {
  options.modules.nixos.desktop = {
    session = mkOption {
      example = "hyprland";

      type = types.enum ["hyprland" "gnome" null];
      default = null;
      description = ''
        The session you want to use (DE or WM with everything around)
        Make sure to also enable it from Home Manager for the full experience!
      '';
    };
  };
}
