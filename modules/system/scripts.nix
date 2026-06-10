{ lib, pkgs, self, ... }:
let
  scriptsDir = self.outPath + "/scripts";
  files = builtins.filter (path: lib.pathIsRegularFile path) (
    lib.filesystem.listFilesRecursive scriptsDir
  );
  fileName = path: builtins.baseNameOf path;

  scriptsPkg = pkgs.runCommand "system-scripts" { } (
    lib.concatStringsSep "\n" (map (path: ''
      install -D -m 0755 ${path} $out/bin/${lib.escapeShellArg (fileName path)}
    '') files)
  );
in
{
  environment.systemPackages = [ scriptsPkg ];
}
