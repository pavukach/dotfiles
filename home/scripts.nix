{ lib, ... }:
let
  scriptsDir = ../scripts;
  files = builtins.filter (path: lib.pathIsRegularFile path) (
    lib.filesystem.listFilesRecursive scriptsDir
  );
  fileName = path: builtins.baseNameOf path;
in
{
  home.file = builtins.listToAttrs (
    map (path: {
      name = ".local/bin/${fileName path}";
      value = {
        source = path;
        executable = true;
      };
    }) files
  );

  home.sessionPath = [ "$HOME/.local/bin" ];
}
