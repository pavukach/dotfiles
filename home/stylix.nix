{ inputs, pkgs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${inputs.nightfox}/extra/nightfox/base16.yaml";
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    icons = {
      enable = true;
      dark = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    targets = {
      neovim.enable = false;
      starship.enable = false;
      kitty.enable = false;
    };
    fonts = {
      sizes = {
        terminal = 12;
        desktop = 12;
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };

  gtk.gtk4.theme = null;
  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
  };

}
