{inputs, ...}: {
  imports = [
    ./services
    ./programs
    ./desktop
    ./shell
  ];

  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      inputs.self.overlays.default
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
