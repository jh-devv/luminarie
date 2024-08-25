{ inputs, ... }:
{
  imports = [
    ./options.nix
    ./desktop
    ./services
    ./programs
    ./shell
  ];

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [ inputs.self.overlays.default ];
    config = {
      allowUnfree = true;
    };
  };
}
