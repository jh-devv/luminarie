{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    overlayAttrs = {
      inherit (inputs.nixpkgs-stable.legacyPackages.${system}) plymouth;

      openrgb = pkgs.openrgb.overrideAttrs (_: rec {
        version = "0760e138";
        src = pkgs.fetchFromGitLab {
          owner = "CalcProgrammer1";
          repo = "OpenRGB";
          rev = version;
          sha256 = "sha256-S/UyebBfqz4aohMLjAJsTH0F4xhN3XEu3kaup5Lql9Q=";
        };
      });
    };
  };
}
