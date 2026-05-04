{
  inputs = {
    flake-file.url = "github:vic/flake-file";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "maksym";
      nixDir = "/home/${username}/nixos";
      pkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit
            inputs
            username
            self
            pkgsConfig
            nixDir
            ;
        };
        modules = [
          (inputs.import-tree ./host)
          (inputs.import-tree ./modules)
          (inputs.import-tree ./secrets)

        ];
      };
    };
}
