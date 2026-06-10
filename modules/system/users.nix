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

  programs.fish.enable = true;
}
