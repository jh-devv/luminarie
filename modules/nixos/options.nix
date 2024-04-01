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
    #security.yubikey = {
    #  enable = mkEnableOption "Enable Yubikey PAM";
    #
    #  id = mkOption {
    #    type = types.str;
    #    description = "Yubikey device serial code";
    #  };
    #};
  };
}
