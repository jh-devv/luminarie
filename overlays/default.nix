# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

modifications = final: prev: {
  rofi-power-menu = prev.rofi-power-menu.overrideAttrs (oldAttrs: rec {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./patches/swaylock.patch
    ];
      installPhase = oldAttrs.installPhase + ''
          ln -s ${prev.swaylock-effects.out}/bin/swaylock $out/bin/swaylock
      '';
  });
};

}
