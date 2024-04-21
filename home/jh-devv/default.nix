{
  home = {
    username = "jh-devv";
    homeDirectory = "/home/jh-devv";
  };

  modules.home = {
    desktop = {
      displays = [
        {
          name = "HDMI-A-1";
          workspaces = [1 2 3 4 5 6 7 8 9 10];
        }
      ];
      session = "hyprland";
      flatpak = {
        enable = true;
        groups = ["media"];
        packages = ["org.prismlauncher.PrismLauncher"];
      };
      power = {
        lockscreen.enable = true;
        hibernation.enable = true;
      };
      firefox.enable = true;
      fractal.enable = true;
      vscode.enable = true;
      logseq.enable = true;
    };
    terminal = {
      neovim.enable = true;
      mpv.enable = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
