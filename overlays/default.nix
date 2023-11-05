# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays

  modifications = final: prev: { 
    gnome = super.gnome.overrideScope' (selfg: superg: {
        gnome-shell = superg.gnome-shell.overrideAttrs (old: {
          patches = (old.patches or []) ++ [
            (pkgs.substituteAll {
              src = ./gnome-shell_3.38.3-3ubuntu1_3.38.3-3ubuntu2.patch;
            })
          ];
        });
  };
}
