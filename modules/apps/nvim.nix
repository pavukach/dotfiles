{
  pkgs,
  self, nixDir,
  ...
}:
{
  hm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      link-tree = import (self.outPath + "/lib/link-tree.nix") {
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
        extraConfig = ''
        lua require("config.lazy")
        lua require("langmapper").automapping({ global = true, buffer = true })'';
      };
      xdg.configFile =
        link-tree {
          source = "${nixDir}/config/nvim";
          target = "nvim";
        }
        // {
          "nvim/parser" = {
            source =
              let
                parsers = pkgs.symlinkJoin {
                  name = "treesitter-parsers";
                  paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
                };
              in
              "${parsers}/parser";
          };
        };
    };

  environment.systemPackages = with pkgs; [
    tree-sitter
    luarocks

    nixfmt
    nil
    marksman
    statix
    clang-tools
    rust-analyzer
  ];
}
