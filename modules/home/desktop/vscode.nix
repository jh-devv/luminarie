{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.vscode;
in {
  config = mkIf cfg.enable {
    programs.vscode.enable = true;
  };
}
