{
  inputs,
  pkgs,
  self,
  nixDir,
  ...
}:
{
  hm = {
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
          test -e "${self.outPath}/secrets/setup.fish" && source "${self.outPath}/secrets/setup.fish"
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
        settings = pkgs.lib.importTOML (self.outPath + "/config/starship.toml");
      };
      zoxide.enable = true;

      direnv = {
        enable = true;
        enableFishIntegration = true;
        nix-direnv.enable = true;
      };
    };
  };

  my.link-to-conf."fish/functions" = "${nixDir}/config/fish-functions";
  environment.systemPackages = with pkgs; [
    fzf
    grc
  ];
}
