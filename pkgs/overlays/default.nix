{inputs, ...}: {
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
