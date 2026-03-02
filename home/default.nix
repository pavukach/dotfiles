{ nixDir, config, ... }:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.stateVersion = "25.11";

  xdg.configFile = {
    copy-menu.source = mkLink "${nixDir}/config/copy-menu";
  };
}
