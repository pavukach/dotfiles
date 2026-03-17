{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "com.usebottles.bottles"
      "com.github.tchx84.Flatseal"
      {
        appId = "com.kagi.OrionGtk";
        bundle = "${inputs.orion}";
      }
    ];
    overrides = {
      "com.usebottles.bottles".Context = {
        filesystems = [
          "~/games"
          "xdg-data/Steam"
        ];
      };
    };
  };
}
