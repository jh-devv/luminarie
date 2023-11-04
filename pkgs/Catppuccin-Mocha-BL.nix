{ lib, stdenv, fetchgit, gtk-engine-murrine }:

stdenv.mkDerivation rec {
  pname = "catppuccin";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/Catppuccino/Catppuccino";
    rev = "master"; # or a specific commit hash if you want a fixed version
    sha256 = "<SHA256 Checksum>"; # Replace with the correct SHA256 hash of the downloaded source
  };

  meta = with lib; {
    description = "Catppuccin GTK theme inspired by vscode themes";
    homepage = "https://github.com/Catppuccino/Catppuccino";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = [ maintainers.gvolpe ];
  };

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -r $src/themes/Catppuccin-Mocha-BL $out/share/themes/Catppuccin
    rm $out/share/themes/Catppuccin/{LICENSE,README.md}
    runHook postInstall
  '';
}
