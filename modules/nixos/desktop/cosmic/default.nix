{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.modules.nixos.desktop.session.cosmic;
in
{
  config = mkIf cfg.enable {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
    };

    services.system76-scheduler.enable = true;

    environment.systemPackages = with pkgs; [ libnotify ];
    xdg.portal.extraPortals = mkForce (
      with inputs.nixos-cosmic.packages.${pkgs.system};
      [
        /*
          (xdg-desktop-portal-cosmic.overrideAttrs (_: {
            # https://github.com/lilyinstarlight/nixos-cosmic/commit/d065ae2b8198d4236c474470214a6aadb6a521bf
            postInstall = ''
              mkdir -p $out/share/{dbus-1/services,icons,xdg-desktop-portal/portals}
              cp -r data/icons $out/share/icons/hicolor
              cp data/*.service $out/share/dbus-1/services/
              cp data/cosmic.portal $out/share/xdg-desktop-portal/portals/
              cp data/cosmic-portals.conf $out/share/xdg-desktop-portal/
            '';
          }))
        */
        xdg-desktop-portal-cosmic
      ]
    );
  };
}
