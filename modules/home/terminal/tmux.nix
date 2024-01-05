{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];
    shell = "${pkgs.zsh}/bin/zsh";
  };
}
