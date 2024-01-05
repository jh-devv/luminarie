# This file defines overlays
{inputs, ...}: {
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

  flake.overlays.default = final: prev: {
    rofi-power-menu = prev.rofi-power-menu.overrideAttrs (oldAttrs: {
      patches =
        (oldAttrs.patches or [])
        ++ [
          ./patches/swaylock.patch
        ];

      postInstall = ''
        ln -s ${prev.swaylock-effects.out}/bin/swaylock $out/bin/swaylock
      '';
    });
  };
}
