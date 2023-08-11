{ buildNpmPackage
, makeWrapper
, which
}:

buildNpmPackage {
  pname = "web";
  version = (builtins.fromJSON (builtins.readFile ../../../server/package.json)).version;

  src = ../../../web;

  postPatch = ''
  '';

  buildInputs = [ ];

  nativeBuildInputs = [ makeWrapper which ];

  checkPhase = ''
    runHook preCheck

    npm run test

    runHook postCheck
  '';

  postInstall = ''
    cp -r build $out/lib/node_modules/immich-web

    mkdir -p $out/bin
    makeWrapper $(which node) $out/bin/immich-web \
      --add-flags $out/lib/node_modules/immich-web/build/index.js
  '';

  npmDepsHash = "sha256-ZDTZHwqrdK4L9229bNMAZKQui40lAVeih5CTadtlOls=";
}
