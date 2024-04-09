{
  lib,
  stdenv,
  fetchurl,
  btrfs-progs,
  e2fsprogs,
  libselinux,
  parted,
  sudo,
  util-linux,
  xfsprogs,
  xz,
}:
stdenv.mkDerivation rec {
  pname = "arm-image-installer";
  version = "4.1";

  buildInputs = [
    btrfs-progs
    e2fsprogs
    libselinux
    parted
    sudo
    util-linux
    xfsprogs
    xz
  ];

  src = fetchurl {
    url = "https://pagure.io/arm-image-installer/archive/arm-image-installer-${version}/arm-image-installer-arm-image-installer-${version}.tar.gz";
    sha256 = "K3qDyVRWKXZVbLUbqifOzWKUT5Nlr36o4tuup+zCYsU=";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp -pt $out/bin arm-image-installer

    mkdir -p $out/share/arm-image-installer
    cp -rpt $out/share/arm-image-installer socs.d boards.d

    mkdir -p $out/share/doc/arm-image-installer
    cp SUPPORTED-BOARDS $out/share/doc/arm-image-installer
  '';

  fixupPhase = ''
    patchShebangs $out/bin
    substituteInPlace $out/bin/arm-image-installer \
    --replace-fail /usr/share/arm-image-installer $out/share/arm-image-installer
    substituteInPlace $out/bin/arm-image-installer \
    --replace-fail /usr/share/doc/arm-image-installer $out/share/doc/arm-image-installer
  '';

  meta = with lib; {
    description = "Install and manipulate ARM disk images";
    homepage = "https://pagure.io/arm-image-installer";
    license = licenses.gpl2;
    maintainers = [];
    platforms = platforms.all;
  };
}
