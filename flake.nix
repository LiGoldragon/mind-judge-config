{
  description = "mind-judge-config — public prompt/config data for Mind judge adapters";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.runCommand "mind-judge-config" { src = ./.; } ''
          mkdir -p "$out"
          cp -R "$src"/* "$out"/
        '';
        checks.manifest = pkgs.runCommand "mind-judge-config-manifest-check" { src = ./.; } ''
          set -euo pipefail
          test -s "$src/manifest.nota"
          test -s "$src/prompts/accepted-knowledge/system.md"
          if find "$src" -name '*.json' -o -name '*.yaml' -o -name '*.yml' -o -name '*.csv' | grep .; then
            echo "forbidden internal artifact format found" >&2
            exit 1
          fi
          touch "$out"
        '';
      });
}
