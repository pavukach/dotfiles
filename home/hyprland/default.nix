{
  config,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = {
      general = {
        layout = "scrolling";
        resize_on_border = true;
        no_focus_fallback = true;
      };
      input = {
        kb_layout = "us, ua";
        kb_options = "grp:win_space_toggle";
      };
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1.25"
      ];
      scrolling = {
        fullscreen_on_one_column = true;
        follow_min_visible = 0;
        # wrap_focus = false;
        # wrap_swapcol = false;
      };
      exec-once = [
        "noctalia-shell"
      ];
      misc = {
        initial_workspace_tracking = 2;
      };
    };
  };
  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
