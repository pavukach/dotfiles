{ lib, config, ... }:
let
  inherit (lib) types;
  inherit (config) my;
in
{
  config.hm =
    { lib, config, ... }:
    let
      inherit (lib) mapAttrsToList;
      inherit (lib.filesystem) listFilesRecursive;
      inherit (config.lib.file) mkOutOfStoreSymlink;
      mkLinkTree =
        target: source:
        let
          sourcePath = /. + source;
          files = listFilesRecursive sourcePath;
          relPath = path: lib.removePrefix (toString sourcePath + "/") (toString path);
        in
        builtins.listToAttrs (
          map (path: {
            name = "${target}/${relPath path}";
            value.source = mkOutOfStoreSymlink path;
          }) files
        );
    in
    {
      config.xdg.configFile = lib.mkMerge (mapAttrsToList mkLinkTree my.link-to-conf);
    };

  options.my.link-to-conf = lib.mkOption {
    type = types.attrsOf types.str;
    default = { };
    description = "Target -> source directories to symlink recursively";
  };
}
