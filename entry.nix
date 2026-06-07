inputs:
let
  system = "x86_64-linux";
  username = "maksym";
  nixDir = "/home/${username}/nixos";
  pkgsConfig = {
    allowUnfree = true;
  };
in
{
  imports = [ ./inputs.nix ];
  systems = [ system ];
  flake = {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit
          inputs
          username
          pkgsConfig
          nixDir
          ;
        inherit (inputs) self;
      };
      modules = [
        (inputs.import-tree ./host)
        (inputs.import-tree ./modules)
        (inputs.import-tree ./secrets)
      ];
    };
  };
}
