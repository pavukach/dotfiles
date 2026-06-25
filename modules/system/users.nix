{ username, pkgs, ... }:
{
  users.users."${username}" = {
    isNormalUser = true;
    description = "Maksym Diachok";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "video"
      "render"
      "input"
    ];
  };

  nix.settings.trusted-users = [ "root" username ];
  programs.fish.enable = true;
}
