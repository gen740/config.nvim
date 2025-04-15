{
  description = "A basic flake with a shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
      ];
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          packages.nvim-conf = pkgs.stdenv.mkDerivation {
            pname = "nvim-conf";
            version = "1.0.0";
            src = ./.;
            installPhase = ''
              mkdir -p $out
              cp -r * $out/
            '';
          };
          devShells.default = pkgs.mkShellNoCC {
            packages = [
              pkgs.lua-language-server
              pkgs.stylua
              pkgs.tokei
            ];
          };
        };
    };
}
