# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
   ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "jh-devv";
    homeDirectory = "/home/jh-devv";
  };

  jh-devv.home = {
    rice = {
      theme = {
        gtk.enable = true;
        qt.enable = true;
      };
      legacy.enable = true;
      rofi.enable = true;
      hyprland.enable = true;
    };
    terminal = {
      zsh.enable = true;
      better-tools.enable = true;
      tmux.enable = true;
      neovim.enable = true;
    };
  };

  home.packages = with pkgs; [
      ani-cli
      cava
      firefox-wayland
      gh
      gradience
      gimp
      inkscape
      imagemagick
      just
      lutgen
      osu-lazer-bin
      popsicle
      steam
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

  nixpkgs.config.firefox.speechSynthesisSupport = true;
  
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
    "application/zip" = "org.gnome.FileRoller.desktop";
    "text/plain" = "org.gnome.gedit.desktop";
  };


  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
