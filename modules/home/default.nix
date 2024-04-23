{inputs, ...}: {
  imports = [
    ./desktop
    ./terminal
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
