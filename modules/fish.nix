{
  inputs,
  pkgs,
  ...
}:
{
  hm =
    { lib, config, ... }:
    let
      link-tree = import ../lib/link-tree.nix {
        inherit lib;
        inherit (config.lib.file) mkOutOfStoreSymlink;
      };
    in
    {
      xdg.configFile = link-tree {
        source = ../config/fish-functions;
        target = "fish/functions";
      };
      programs = {
        fish = {
          enable = true;
          shellAliases = {
            ls = "eza --icons";
            yazi = "y";
            nvim = "run-tui nvim";
            btop = "run-tui btop";
            gp = "git add . && git commit && git push";
            gc = "git add . && git commit";
            cd = "z";
          };
          interactiveShellInit = (builtins.readFile "${inputs.nightfox}/extra/nightfox/nightfox.fish") + ''
            test -e "${../secrets/setup.fish}" && source "${../secrets/setup.fish}"
          '';
          plugins = with pkgs.fishPlugins; [
            {
              name = "grc";
              inherit (grc) src;
            }
            {
              name = "fzf";
              inherit (fzf) src;
            }
            {
              name = "autopair";
              inherit (autopair) src;
            }
            {
              name = "done";
              inherit (done) src;
            }
          ];
        };

        starship = {
          enable = true;
          enableFishIntegration = true;
          settings = pkgs.lib.importTOML ../config/starship.toml;
        };
        zoxide.enable = true;

        direnv = {
          enable = true;
          enableFishIntegration = true;
          nix-direnv.enable = true;
        };
      };
    };

  environment.systemPackages = with pkgs; [
    fzf
    grc
  ];
}
