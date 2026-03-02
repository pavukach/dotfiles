let
  scriptsDir = ../scripts;
  scripts = builtins.attrNames (builtins.readDir scriptsDir);
in
{
  home.file = builtins.listToAttrs (map (name: {
    name = ".local/bin/${name}";
    value = {
      source = "${scriptsDir}/${name}";
      executable = true;
    };
  }) scripts);

  home.sessionPath = [ "$HOME/.local/bin" ];
}
