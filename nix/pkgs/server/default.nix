{ buildNpmPackage
, makeWrapper
, imagemagick
, ffmpeg
, libraw
, vips
, pkg-config
, python3
, which
}:

buildNpmPackage {
  pname = "server";
  version = (builtins.fromJSON (builtins.readFile ../../../server/package.json)).version;

  src = ../../../server;

  postPatch = ''
    rm bin/build-*
  '';

  buildInputs = [ imagemagick ffmpeg libraw vips ];

  nativeBuildInputs = [ pkg-config python3 makeWrapper which ];

  checkPhase = ''
    runHook preCheck

    npm run test

    runHook postCheck
  '';

  postInstall = ''
    cp dist -r $out/lib/node_modules/immich
    makeWrapper $(which node) $out/bin/immich \
      --add-flags $out/lib/node_modules/immich/dist/main.js

    makeWrapper $(which node) $out/bin/immich-admin \
      --run "$(cat start.sh | grep -v exec)" \
      --add-flags $out/lib/node_modules/immich/dist/main.js
  '';

  npmDepsHash = "sha256-5Xh2pt9N8Tt086aKA89DfjycwlnkzLpeyU2zyoHI2DE=";
}
