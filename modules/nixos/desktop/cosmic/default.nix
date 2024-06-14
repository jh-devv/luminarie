{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.nixos.desktop.session.cosmic;
in {
  config = mkIf cfg.enable {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;

    environment.systemPackages = with pkgs; [
      libnotify
    ];

    # This sets the PATH for systemd user sessions to include necessary directories.
    # For example, this is needed to run xdg-open from an xdg-desktop-portal.
    systemd.user.extraConfig = ''DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"'';
  };
}
