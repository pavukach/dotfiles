{
  inputs,
  pkgs,
  nixDir,
  config,
  ...
}:
let
  linkDir = import ../lib/linkDir.nix { inherit config; };

in
{
  xdg.configFile = linkDir "${nixDir}/config/fish-functions" "fish/functions";
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
        test -e "${nixDir}/secrets/setup.fish" && source "${nixDir}/secrets/setup.fish"
      '';
      plugins = with pkgs.fishPlugins; [
        {
          name = "grc";
          src = grc.src;
        }
        {
          name = "fzf";
          src = fzf.src;
        }
        {
          name = "autopair";
          src = autopair.src;
        }
        {
          name = "done";
          src = done.src;
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

  home.packages = with pkgs; [
    fzf
    grc
  ];
}
