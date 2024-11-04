{
  description = "Proton CachyOS build";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      protonCachyosVersions = builtins.fromJSON (builtins.readFile ./versions.json);
    in {
      packages.${system} = {
        default = self.packages.${system}.proton-cachyos;
        proton-cachyos = pkgs.callPackage ./default.nix {
          inherit protonCachyosVersions;
        };
      };
    };
}
