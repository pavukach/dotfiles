{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in

{
  hm.programs.zen-browser.profiles.default.extensions.packages = with firefox-addons; [
    ublock-origin
    darkreader
    translate-web-pages
    proton-pass
    private-grammar-checker-harper
    surfingkeys
  ];
}
