{pkgs, ...}: {
  home = {
    username = "jh-devv";
    homeDirectory = "/home/jh-devv";
  };

  modules.home.desktop = {
    displays = [
      {
        name = "DP-2";
        workspaces = [1 2 3 4 5 6 7 8 9 10];
      }
    ];
    session = "hyprland";
    flatpak = {
      enable = true;
      groups = ["media"];
      packages = ["org.prismlauncher.PrismLauncher"];
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "application/zip" = "org.gnome.FileRoller.desktop";
      "text/plain" = "org.gnome.gedit.desktop";
    };
  };

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
    fractal
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
