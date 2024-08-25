{ inputs, ... }:
{
  imports = [ inputs.pre-commit-hooks.flakeModule ];

  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit = {
        check.enable = true;
        settings.excludes = [ "flake.lock" ];
        settings.hooks = {
          nixfmt = {
            enable = true;
            package = pkgs.nixfmt-rfc-style;
          };
          deadnix.enable = true;
          prettier.enable = true;
          statix.enable = true;
          nil.enable = true;
        };
      };
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          just
        ];
        shellHook = ''
          ${config.pre-commit.installationScript}
        '';
      };
      formatter = pkgs.nixfmt-rfc-style;
    };
}
