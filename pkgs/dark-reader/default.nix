{
  lib,
  fetchFromGitHub,
  buildNpmPackage,
  darkScheme ? {
    background = "1e1e2e";
    foreground = "cdd6f4";
  },
  lightScheme ? {
    background = "eff1f5";
    foreground = "4c4f69";
  },
  ...
}:
buildNpmPackage rec {
  pname = "darkreader";
  version = "4.9.67";

  src = fetchFromGitHub {
    owner = "darkreader";
    repo = "darkreader";
    rev = "v${version}";
    hash = "sha256-lz7wkUo4OB/Gu/q45RVpj9Vmk4u65D0opvjgOeEjjpw=";
  };

  npmDepsHash = "sha256-DgijQj3p4yiAUlwUC1cXkF8afHdm2ZOd/PNXVt6WZW8=";

  patchPhase = ''
    runHook prePatch
    sed -i 's/181a1b/${darkScheme.background}/g; s/e8e6e3/${darkScheme.foreground}/g' src/defaults.ts
    sed -i 's/dcdad7/${lightScheme.background}/g; s/181a1b/${lightScheme.foreground}/g' src/defaults.ts
    runHook postPatch
  '';

  npmBuildFlags = ["--" "--firefox"];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/
    cp build/release/${pname}-firefox.xpi $out/
    runHook postInstall
  '';

  meta = with lib; {
    description = "The Dark Reader Chrome and Firefox extension.";
    homepage = "https://github.com/darkreader/darkreader";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
