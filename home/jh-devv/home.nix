{
  pkgs,
  lib,
  ...
}: {
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
      power = {
        lockscreen.enable = true;
        hibernation.enable = true;
      };
    };
    programs = lib.genAttrs ["firefox" "fractal" "kitty" "mpv" "nautilus" "neovim" "newsboat" "text-editor" "vscode"] (_k: {enable = true;});
    services = lib.genAttrs ["mpris-proxy"] (_k: {enable = true;});

    shell = {
      package = pkgs.zsh;
      subtitutes.enable = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
