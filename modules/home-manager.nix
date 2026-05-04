{
  self,
  inputs,
  username,
  pkgsConfig, lib,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs username self; };
    useUserPackages = true;
    sharedModules = [ { nixpkgs.config = pkgsConfig; } ];
    backupFileExtension = "hm-backup";
  };
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (lib.mkAliasOptionModule ["hm"] ["home-manager" "users" username] )
  ];
  hm =
    { config, ... }:
    let
      mkLink = config.lib.file.mkOutOfStoreSymlink;
    in
    {
      imports = [ (inputs.import-tree ../home) ];

      home.stateVersion = "25.11";
      xdg.configFile = {
        copy-menu.source = mkLink "${self.outPath}/config/copy-menu";
      };
    };
}
