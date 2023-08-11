{
  description = "Self-hosted photo and video backup solution directly from your mobile phone.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

  flake-utils.lib.eachDefaultSystem (system: let
    pkgs = import nixpkgs { inherit system; };
    pythonPackages = pkgs.python311Packages.overrideScope (self: super: {
      albumentations = super.albumentations.overrideAttrs (old: {
        dontUsePytestCheck = true;
        dontUseSetuptoolsCheck = true;
      }); # missing Delaunay.vertex in some tests
    });
  in {

    packages = {
      machine-learning = pythonPackages.callPackage ./nix/pkgs/machine-learning {};
    };

  });
}
