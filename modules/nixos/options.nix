{lib, ...}:
with lib; {
  options.modules.nixos = {
    shell = mkOption {
      example = ["zsh"];

      type = types.enum ["zsh" null];
      description = ''
        The shell you want to use.
          possible values: see Example.
      '';
    };
    boot.secure-boot.enable = mkEnableOption "secure-boot" // {default = true;};
  };
}
