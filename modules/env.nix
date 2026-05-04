{ inputs, pkgs, nixDir, ... }:
{
  hm.home.sessionVariables = {
    # ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
    CHROME_EXECUTABLE = "${inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.helium-nightly}/bin/helium";
    PATH = "$HOME/flutter/bin:$PATH";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";

    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "helium";
    TERMINAL = "kitty";

    NIX_DIR = nixDir;
  };
}
