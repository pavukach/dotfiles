{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "Nightfox";
    font.name = "JetBrainsMono Nerd Font Mono";
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      hide_window_decorations = true;
      mouse_hide_wait = "-1.0";
      cursor_stop_blinking_after = "5.0";
      cursor_trail = "1";
      cursor_trail_start_threshold = "0";
      cursor_blink_interval = "0.5 ease-in-out";
      window_padding_width = 10;
      font_size = 12;
      placement_strategy = "bottom-left";
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";
      # dynamic_background_opacity = true;
      # background_opacity = "0.5";
      # background_blur = 5;
    };
    actionAliases = {
      kitty_scrollback_nvim = "kitten '/home/maksym/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py' --nvim-args --noplugin -n";
    };
    keybindings = {
      # Browse scrollback buffer in kitty
      "kitty_mod+h" = "kitty_scrollback_nvim";
      # Browse output of the last shell command in kitty
      "kitty_mod+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";
    };
    mouseBindings = {
      # Show clicked command output in kitty
      "ctrl+shift+right" =
        "press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output";
    };
  };
}
