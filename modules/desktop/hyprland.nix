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
    { config, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        configType = "lua";
        package = null;
        portalPackage = null;
        systemd.enable = false;
      };
      xdg.configFile."uwsm/env".source =
        "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
    };

  my.link-to-conf."hypr" = "${nixDir}/config/hypr";
  environment.etc."hypr/stubs".source = "${pkgs.hyprland}/share/hypr/stubs";
}
