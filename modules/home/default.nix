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
      firefox.speechSynthesisSupport = true;
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
