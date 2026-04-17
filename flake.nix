{
  inputs = {
    nixpkg-freerdp.url = "github:NixOS/nixpkgs/92b637a63e15d2797251e4006b0e82b5c6192911";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nightfox = {
      url = "github:EdenEast/nightfox.nvim";
      flake = false;
    };
    orion = {
      url = "https://orionbrowser.com/download/oriongtk-early-beta";
      flake = false;
    };

    helium = {
      url = "github:ForkPrince/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "maksym";
      nixDir = "/home/${username}/nixos";
      readDir =
        dir:
        builtins.filter (path: nixpkgs.lib.hasSuffix ".nix" (toString path)) (
          nixpkgs.lib.filesystem.listFilesRecursive dir
        );
      pkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs username nixDir;
        };
        modules = builtins.concatLists [
          [
            inputs.home-manager.nixosModules.home-manager
            (
              { pkgs, stdenv, ... }:
              {
                nixpkgs.overlays = [
                  (final: prev: {
                    inherit (inputs.nixpkg-freerdp.legacyPackages.${system}) freerdp;
                  })
                ];
              }
            )
          ]
          (readDir ./host)
          (readDir ./modules)
          (readDir ./secrets)
          [
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs username nixDir; };
                useUserPackages = true;
                sharedModules = [ { nixpkgs.config = pkgsConfig; } ];
                backupFileExtension = "hm-backup";
                users.${username}.imports = readDir ./home;
              };
              nixpkgs.config = pkgsConfig;
            }
          ]
        ];
      };
    };
}
