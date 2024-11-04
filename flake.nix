{
  inputs = {
    nix-proton-cachyos-git = {
      url = "git+http://192.168.0.124:5000/tooe/nix-proton-cachyos-git.git";
    };
  };

  outputs = { self, nixpkgs, nix-proton-cachyos-git, ... }@inputs:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          myPackage = pkgs.callPackage ./default.nix {};
          protonCachyos = nix-proton-cachyos-git.packages.${system}.proton-cachyos;
        }
      );
    };
}
