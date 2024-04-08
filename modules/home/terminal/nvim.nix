{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.terminal;
in {
  config = mkIf cfg.neovim.enable {
    programs.neovim.enable = true;
  };
}
