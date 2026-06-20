{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    flutter
    nodejs
    python315
    dotnet-sdk
    gcc
    dart
    crystal
    ruby
    rustc
    cargo
    jdk
    godot
    android-studio

    gnumake
    cmake

    ollama-vulkan
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
