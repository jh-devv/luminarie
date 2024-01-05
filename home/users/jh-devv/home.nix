# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{pkgs, ...}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  home = {
    username = "jh-devv";
    homeDirectory = "/home/jh-devv";
  };

  jh-devv.home.displays = [
    {
      name = "DP-2";
      workspaces = [1 2 3 4 5 6 7 8 9 10];
    }
  ];

  home.packages = with pkgs; [
    ani-cli
    cava
    firefox-wayland
    gradience
    gimp
    inkscape
    imagemagick
    just
    lutgen
    osu-lazer-bin
    trash-cli
    vscode
    wine
    yubikey-manager-qt
    yubioath-flutter
    opentofu
    zola
    gparted
    p7zip
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
