{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.shell;
in {
  config = mkIf (cfg.package == pkgs.zsh) {
    programs = {
      zsh = {
        enable = true;
        initExtra = getExe cfg.fetcher.package;

        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git"];
        };
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
      };

      direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };
}
