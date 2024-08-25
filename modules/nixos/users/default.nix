{ config, ... }:
{
  config = {
    users = {
      inherit (config.modules.nixos) users;
    };
  };
}
