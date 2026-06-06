{
  pkgs,
  nixDir,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  hm =
    { lib, config, ... }:
    let
      link-tree = import ../lib/link-tree.nix {
        inherit lib;
        inherit (config.lib.file) mkOutOfStoreSymlink;
      };
    in
    {
      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        package = null;
        portalPackage = null;
        systemd.enable = false;
      };
      xdg.configFile = {
        "uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
      }
      // link-tree {
        source = "${nixDir}/config/hypr";
        target = "hypr";
      };
    };

  environment.etc."hypr/stubs".source = "${pkgs.hyprland}/share/hypr/stubs";
}
