{
  pkgs,
  lib,
  config,
  ...
}:
let
  link-tree = import ../lib/link-tree.nix {
    inherit lib;
    inherit (config.lib.file) mkOutOfStoreSymlink;
  };
in
{
  programs.neovim = {
    enable = true;
    withRuby = true;
    withPython3 = false;
    withNodeJs = false;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
    extraConfig = ''lua require("config.lazy")'';
  };
  xdg.configFile = link-tree {
    source = ../config/nvim;
    target = "nvim";
  };
  home.packages = with pkgs; [
    nixfmt
    nil
  ];
}
