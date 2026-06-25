{
  self,
  inputs,
  username,
  lib,
  nixDir,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs username self; };
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    useGlobalPkgs = true;
  };
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" username ])
  ];
  hm =
    { config, ... }:
    let
      mkLink = config.lib.file.mkOutOfStoreSymlink;
    in
    {
      home.stateVersion = "25.11";
      xdg.configFile = {
        copy-menu.source = mkLink "${nixDir}/config/copy-menu";
      };
    };
}
