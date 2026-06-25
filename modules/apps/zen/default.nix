{ inputs, ... }:
{
  hm.imports = [
    inputs.zen-browser.homeModules.beta
  ];

  hm.programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = false;
    profiles.default = {
      containersForce = true;
      spacesForce = false;
    };
  };
}
