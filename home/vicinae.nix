{ pkgs, ... }:
{
  programs.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    systemd = {
      enable = true;
      autoStart = true;
    };
    useLayerShell = true;
    settings = {
      dark.icon_theme = "Papirus";
      launcher_window = {
        layer_shell = {
          keyboard_interactivity = "exclusive";
          layer = "top";
        };
      };
    };
  };

}
