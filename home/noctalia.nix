{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce (builtins.fromJSON (builtins.readFile ../config/noctalia.json));
    colors = lib.mkForce {
      mError = "#ffb2bf";
      mOnError = "#561d2b";
      mOnPrimary = "#003738";
      mOnSecondary = "#3a255b";
      mOnSurface = "#b8f5f4";
      mOnSurfaceVariant = "#a8e3e2";
      mOnTertiary = "#003826";
      mOnHover = "#80d4d6";
      mOutline = "#7193d6";
      mPrimary = "#63cdcf";
      mSecondary = "#9d79d6";
      mShadow = "#000000";
      mSurface = "#192330";
      mHover = "#02499c";
      mSurfaceVariant = "#29394f";
      mTertiary = "#81b29a";
    };
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        screen-toolkit = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "slowbongo" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };

    pluginSettings = {
      privacy-indicator = {
        hideInactive = true;
        iconSpacing = 4;
      };
      slowbongo = {
        catSize = 1;
        catOffsetY = 0;
        raveMode = false;
        tappyMode = true;
        inputDevices = [ "/dev/input/event10" ];
      };
      screen-toolkit = {
        videoPath = "~/media/videos/";
        screenshotPath = "~/media/pictures/";
      };
    };
  };

  home.packages = with pkgs; [
    evtest
    cava
    grim
    slurp
    wl-clipboard
    tesseract
    imagemagick
    zbar
    curl
    translate-shell
    wl-screenrec
    ffmpeg
    gifski
    jq
  ];
}
