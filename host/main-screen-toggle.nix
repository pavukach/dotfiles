{
  pkgs,
  lib,
  inputs,
  nixDir,
  username,
  ...
}:
let
  runtimePath = lib.makeBinPath [
    pkgs.wlr-randr
    pkgs.gnugrep
    pkgs.gawk
    pkgs.coreutils
    pkgs.fish
  ];
in
{
  environment.etc."greetd/sway-greeter-config".text = lib.mkForce ''
    default_border none
    default_floating_border none
    gaps inner 0
    gaps outer 0
    for_window [app_id="kitty"] fullscreen enable



    input * {
        xkb_layout "us"
        repeat_delay 400
        repeat_rate 40
    }
    input type:touchpad {
        tap enabled
    }

    # hide cursor after 1 second of inactivity
    seat * hide_cursor 1000

    exec "PATH=${runtimePath} ${../scripts/screen-toggle}"

    # Startup applications
    # Start gslapper with default wallpaper (forked to background with IPC socket)
    exec gslapper -f -I /tmp/sysc-greet-wallpaper.sock '*' /usr/share/sysc-greet/wallpapers/sysc-greet-default.png
    exec "XDG_CACHE_HOME=/tmp/greeter-cache HOME=/var/lib/greeter ${pkgs.kitty}/bin/kitty --start-as=fullscreen --config=/etc/greetd/kitty.conf ${
      inputs.sysc-greet.packages.${pkgs.stdenv.hostPlatform.system}.default
    }/bin/sysc-greet; ${pkgs.sway}/bin/swaymsg exit"
  '';

  home-manager.users."${username}".imports = [
    {
      wayland.windowManager.hyprland.settings.exec = [ "${../scripts/screen-toggle}" ];
    }
  ];
}
