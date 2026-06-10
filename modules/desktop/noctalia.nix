{
  inputs,
  lib,
  pkgs,
  self,
  ...
}:
{


  hm =
    { config, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = lib.mkForce (
          builtins.fromTOML (builtins.readFile (self.outPath + "/config/noctalia.toml"))
        );
      };


        xdg.configFile."noctalia/palettes/nightfox.json".text = builtins.toJSON {
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
    };

  environment.systemPackages = with pkgs; [
    evtest
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
