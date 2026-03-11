{ ... }:
{

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "kitty -e yazi";
    "$browser" = "helium";
    "$menu" = "vicinae toggle";
    gesture = [
      "2, pinchin, mod: $mod, cursorZoom, 1.6, mult"
      "2, pinchout, mod: $mod, cursorZoom, 0.625, mult"
      "3, left, dispatcher, movefocus, l"
      "3, right, dispatcher, movefocus, r"
      "3, vertical, workspace"
    ];
    gestures = {
      workspace_swipe_invert = false;
      workspace_swipe_distance = 150;
      workspace_swipe_min_speed_to_force = 5;
    };
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, movewindow"
    ];
    bindel = [
      ", XF86AudioRaiseVolume, exec, noctalia-shell ipc call volume increase"
      ", XF86AudioLowerVolume, exec, noctalia-shell ipc call volume decrease"
      ", XF86AudioMute, exec, noctalia-shell ipc call volume muteOutput"
      ", XF86MonBrightnessUp, exec, noctalia-shell ipc call brightness increase"
      ", XF86MonBrightnessDown, exec, noctalia-shell ipc call brightness decrease"
    ];
    bind = [
      "$mod ALT, P, exec, systemctl poweroff"
      "$mod ALT, S, exec, systemctl suspend"
      "$mod ALT, R, exec, systemctl reboot"
      "$mod ALT, Q, exec, exit"
      "$mod ALT, G, exec, perf-mode"

      "$mod, S, exec, noctalia-shell ipc call settings toggle"
      ", Print, exec, noctalia-shell ipc call plugin:screen-shot-and-record screenshot"

      "$mod, Return, exec, $terminal"
      "$mod SHIFT, Return, exec, toggleterm"
      "$mod, D, exec, $menu"
      "$mod, E, exec, $filemanager"
      "$mod ALT, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
      "$mod ALT, E, exec, vicinae vicinae://extensions/vicinae/core/search-emojis"
      "$mod ALT, W, exec, vicinae vicinae://extensions/vicinae/wm/switch-windows"
      "$mod ALT, L, exec, copy-menu links"

      "$mod, Q, killactive"
      "$mod SHIFT, Q, forcekillactive"
      "$mod, V, togglefloating"
      "$mod CTRL, F, fullscreen"
      "$mod, F, exec, hyprfullscreen"

      "$mod, H, movefocus, l"
      "$mod, J, exec, hyprchangefocus d r+1"
      "$mod, K, exec, hyprchangefocus u r-1"
      "$mod, L, movefocus, r"
      "$mod SHIFT, H, layoutmsg, swapcol l"
      "$mod SHIFT, J, movewindow, d"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, L, layoutmsg, swapcol r"
      "$mod, code:34, movewindow, l"
      "$mod, code:35, movewindow, r"
      "$mod, Equal, layoutmsg, colresize +0.1"
      "$mod, Minus, layoutmsg, colresize -0.1"
      "$mod CTRL, Equal, layoutmsg, colresize +conf"
      "$mod CTRL, Minus, layoutmsg, colresize -conf"
    ]
    ++ (builtins.concatLists (
      builtins.genList (
        i:
        let
          ws = i + 1;
        in
        [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          "$mod CTRL, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
        ]
      ) 9
    ));
  };
}
