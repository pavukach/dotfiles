{ inputs, ... }: {
  hm.programs.zen-browser.profiles.default = {
    settings = {
      "zen.workspaces.continue-where-left-off" = true;
      "zen.urlbar.behavior" = "float";
      "zen.welcome-screen.seen" = true;
      "browser.tabs.allow_transparent_browser" = true;
    };
    extraConfig = builtins.readFile "${inputs.betterfox}/zen/user.js";
  };
}
