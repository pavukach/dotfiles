{ lib, mkOutOfStoreSymlink }:

{
  source,
  target ? "",
}:

let
  files = lib.filesystem.listFilesRecursive source;

  relPath = path: lib.removePrefix (toString source + "/") (toString path);

in
builtins.listToAttrs (
  map (path: {
    name = "${target}/${relPath path}";
    value.source = mkOutOfStoreSymlink path;
  }) files
)
