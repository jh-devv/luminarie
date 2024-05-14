{lib, ...}:
with lib; {
  options.modules.nixos.language = {
    locale = mkOption {
      type = types.str;

      default = "en_US.UTF-8";
      example = "fi_FI.UTF-8";
    };
    layout = mkOption {
      type = types.str;

      default = "us";
      example = "fi";
    };
    time = mkOption {
      type = types.str;

      default = "America/New_York";
      example = "Europe/Helsinki";
    };
  };
}
