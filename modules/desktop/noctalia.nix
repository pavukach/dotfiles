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
        dark = {
          mPrimary = "#63cdcf";
          mOnPrimary = "#003738";
          mSecondary = "#9d79d6";
          mOnSecondary = "#3a255b";
          mTertiary = "#81b29a";
          mOnTertiary = "#003826";
          mError = "#ffb2bf";
          mOnError = "#561d2b";
          mSurface = "#192330";
          mOnSurface = "#b8f5f4";
          mSurfaceVariant = "#29394f";
          mOnSurfaceVariant = "#a8e3e2";
          mHover = "#02499c";
          mOnHover = "#80d4d6";
          mOutline = "#7193d6";
          mShadow = "#000000";
          terminal = {
            foregroun = "#cdcecf";
            background = "#192330";
            selectionFg = "#cdcecf";
            selectionBg = "#2b3b51";
            cursorText = "#192330";
            cursor = "#aeafb0";
            normal = {
              black = "#192330";
              red = "#c94f6d";
              # orange = "#f4a261";
              yellow = "#dbc074";
              green = "#81b29a";
              cyan = "#63cdcf";
              blue = "#719cd6";
              magenta = "9d79d6";
              white = "cdcecf";
            };
            bright = {
              black = "#192330";
              red = "#c94f6d";
              # orange = "#f4a261";
              yellow = "#dbc074";
              green = "#81b29a";
              cyan = "#63cdcf";
              blue = "#719cd6";
              magenta = "9d79d6";
              white = "cdcecf";
            };
          };
        };
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
