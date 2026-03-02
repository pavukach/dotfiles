{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop
    wayfreeze

    luarocks

    # hyphen
    # hyphenDicts.en-us
  ];

  fonts.packages = with pkgs; [
    corefonts
  ];
}
