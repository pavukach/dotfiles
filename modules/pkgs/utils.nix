{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop
    luarocks
  ];

  fonts.packages = with pkgs; [
    corefonts
  ];
}
