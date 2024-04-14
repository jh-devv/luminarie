{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop;
in {
  config = mkIf cfg.vscode.enable {
    programs.vscode.enable = true;
  };
}
