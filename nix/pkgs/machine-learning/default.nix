{ buildPythonPackage
, poetry-core
, pythonRelaxDepsHook
, pytorch
, transformers
, sentence-transformers
, onnxruntime
, opencv4
, pillow
, fastapi
, uvicorn
, pydantic
, aiocache
, httptools
, python-dotenv
, uvloop
, watchfiles
, websockets
, insightface
, cython
, pytestCheckHook
, pytest-mock
, pytest-asyncio
}:

buildPythonPackage {
  pname = "machine_learning";
  version = (builtins.fromJSON (builtins.readFile ../../../server/package.json)).version;

  format = "pyproject";

  src = ../../../machine-learning;

  NIX_DEBUG=1;

  pythonRelaxDeps = [
    "fastapi"
    "pillow"
    "uvicorn"
  ];

  pythonRemoveDeps = [
    "opencv-python-headless"  # nixpkgs provides with a different name but it's the same lib
  ];

  nativeBuildInputs = [ poetry-core pythonRelaxDepsHook cython ];

  postPatch = ''
    substituteInPlace app/*.py app/**/*.py \
      --replace cv2.Mat np.array
  '';

  postInstall = ''
    mkdir -p $out/bin
    {
      echo '#!/usr/bin/env python3'
      cat app/main.py
    } > $out/bin/$pname
    chmod +x $out/bin/$pname
    substituteInPlace $out/bin/$pname --replace 'from .' 'from app.'
  '';

  propagatedBuildInputs = [
    pytorch
    transformers
    sentence-transformers
    onnxruntime
    opencv4
    pillow
    fastapi
    uvicorn
    pydantic
    aiocache
    httptools
    python-dotenv
    uvloop
    watchfiles
    websockets
    insightface
  ];

  nativeCheckInputs = [ pytestCheckHook pytest-mock pytest-asyncio ];

}
