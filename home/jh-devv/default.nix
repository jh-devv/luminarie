{inputs, ...}: {
  imports = [
    inputs.arkenfox.hmModules.arkenfox

    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.hyprland-hypridle.homeManagerModules.hypridle
    inputs.hyprland-hyprlock.homeManagerModules.hyprlock

    ../../modules/home
    ./home.nix
  ];
}
